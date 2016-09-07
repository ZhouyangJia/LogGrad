import os, string, sys, random, segment


def get_words(my_name):
	ret = []
	for d in range(10):
		my_name = my_name.replace(str(d),'')
	names_list = my_name.replace(':','_').replace('(','_').replace(')','_').replace(' ','_').split('_')
	for name in names_list:
		if len(name) > 0:
			seg_list = segment.segment(name)
			for seg in seg_list:
				ret.append(seg)
	return ret



mycomd = 'Command: ';
for arg in sys.argv:
	mycomd = mycomd+' '+arg

projcnt = (len(sys.argv) - 1) / 2

frm = []
domaindict = {}

domain_list = []
project_list = []
for proj in range(projcnt):

	domain = sys.argv[proj*2+2]
	project = sys.argv[proj*2+1]
	if '/' in project:
		project = project.split('/')[-1]
	if '.' in project:
		project = project.split('.')[-2]


	domain_list.append(domain)
	project_list.append(project)
	domaindict[domain] = 1

	frm_proj = []
	myfile = open(sys.argv[proj*2+1], 'r')
	myfilelines = myfile.readlines()
	myfile.close()
	for line in myfilelines:
		line = line.strip()
		element = line.split(',')
		if len(element) != 3:
			continue
		newline = [domain, project, element[0], element[1], element[2]]
		frm_proj.append(newline)

	frm.append(frm_proj)

#for i in range(len(frm)):
	#print frm[i][0][2],get_words(frm[i][0][2])

result = []

#print 'Intra-project Rate'
for t in range(21):
	th = t*0.05
	#print 'Threshold:',th

	tmpresult = []
	for i in range(len(frm)):
		#print 'Project',i+1,

		totalcall = 0.0
		totallog = 0.0
		totalmiss = 0.0
		for j in range(len(frm[i])):
			call = float(frm[i][j][3])
			log = float(frm[i][j][4])
			totalcall += call
			totallog += log
			if log/call >= th:
				totalmiss += call - log
		#print totalcall, totalmiss, totalmiss/totalcall
		tmptmpresult = [totalcall, totallog, totalmiss, totalmiss/totalcall, 0, 0, 0, 0]
		tmpresult.append(tmptmpresult)
	result.append(tmpresult)



wrmdict_call = {}
wrmdict_log = {}
wrmdomdict_call = {}
wrmdomdict_log = {}

for i in range(len(frm)):
	for j in range(len(frm[i])):
		domain = frm[i][j][0]
		words = get_words(frm[i][j][2])
		for word in words:
			if word in wrmdict_call.keys():
				wrmdict_call[word] += float(frm[i][j][3])
				wrmdict_log[word] += float(frm[i][j][4])
			else:
				wrmdict_call[word] = float(frm[i][j][3])
				wrmdict_log[word] = float(frm[i][j][4])

			if domain+'_'+word in wrmdomdict_call.keys():
				wrmdomdict_call[domain+'_'+word] += float(frm[i][j][3])
				wrmdomdict_log[domain+'_'+word] += float(frm[i][j][4])
			else:
				wrmdomdict_call[domain+'_'+word] = float(frm[i][j][3])
				wrmdomdict_log[domain+'_'+word] = float(frm[i][j][4])

#for item in wrmdict_call:
	#if wrmdict_log[item]/wrmdict_call[item] > 0.3:
		#print item,wrmdict_call[item],wrmdict_log[item]


#print 'Inter-project & Inter-domain Rate'
for t in range(21):
	th = t*0.05
	#print 'Threshold:',th

	for i in range(len(frm)):
		#print 'Project',i+1,

		totalcall = 0.0
		totalmiss = 0.0
		for j in range(len(frm[i])):
			call = float(frm[i][j][3])
			log = float(frm[i][j][4])
			totalcall += call
			words = get_words(frm[i][j][2])
			domain = frm[i][j][0]
			for word in words:
				if wrmdomdict_log[domain+'_'+word]/wrmdomdict_call[domain+'_'+word] >= th:
					totalmiss += call - log
					break;
		#print totalcall, totalmiss, totalmiss/totalcall
		result[t][i][4] = totalmiss
		result[t][i][5] = totalmiss/totalcall


#print 'Inter-project & Intra-domain Rate'
for t in range(21):
	th = t*0.05
	#print 'Threshold:',th

	for i in range(len(frm)):
		#print 'Project',i+1,

		totalcall = 0.0
		totalmiss = 0.0
		for j in range(len(frm[i])):
			call = float(frm[i][j][3])
			log = float(frm[i][j][4])
			totalcall += call
			words = get_words(frm[i][j][2])
			for word in words:
				if wrmdict_log[word]/wrmdict_call[word] >= th:
					totalmiss += call - log
					break;
		#print totalcall, totalmiss, totalmiss/totalcall
		result[t][i][6] = totalmiss
		result[t][i][7] = totalmiss/totalcall

def comment():
	for t in range(21):
		th = t*0.05
		print str(th)+',I1'+',I1R'+',I2'+',I2R'+',I3'+',I3R'
		for i in range(len(frm)):
			for j in range(8):
				print str("%.4f"%result[t][i][j])+',',
			print

	print
	print
	return

print 'Intra-project log-missing rate in different confidence:'
print 'Project, domain,',
for t in range(1, 19):
	print str(float(t)*0.05)+',',
print
for i in range(len(frm)):
	print project_list[i],domain_list[i],
	for t in range(1, 19):
		print str("%.4f"%result[t][i][3])+',',
	print 

print
print

print 'Intra-domain log-missing rate in different confidence:'
print 'Project, domain,',
for t in range(1, 19):
	print str(float(t)*0.05)+',',
print
for i in range(len(frm)):
	print project_list[i],domain_list[i],
	for t in range(1, 19):
		print str("%.4f"%result[t][i][5])+',',
	print 

print
print

print 'Inter-domain log-missing rate in different confidence:'
print 'Project, domain,',
for t in range(1, 19):
	print str(float(t)*0.05)+',',
print
for i in range(len(frm)):
	print project_list[i],domain_list[i],
	for t in range(1, 19):
		print str("%.4f"%result[t][i][7])+',',
	print 