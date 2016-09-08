; ModuleID = '/Users/zhouyangjia/llvm-3.8.0.src/tools/clang/tools/clang-loggrad/test/bftpd/bftpdutmp.c'
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.11.0"

%struct.__sFILE = type { i8*, i32, i32, i16, i16, %struct.__sbuf, i32, i8*, i32 (i8*)*, i32 (i8*, i8*, i32)*, i64 (i8*, i64, i32)*, i32 (i8*, i8*, i32)*, %struct.__sbuf, %struct.__sFILEX*, i32, [3 x i8], [1 x i8], %struct.__sbuf, i32, i64 }
%struct.__sFILEX = type opaque
%struct.__sbuf = type { i8*, i32 }
%struct.bftpdutmp = type { i8, i32, [31 x i8], [256 x i8], i64 }

@bftpdutmp = global %struct.__sFILE* null, align 8
@bftpdutmp_offset = global i64 4294967295, align 8
@.str = private unnamed_addr constant [15 x i8] c"PATH_BFTPDUTMP\00", align 1
@.str.1 = private unnamed_addr constant [5 x i8] c"none\00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"a\00", align 1
@.str.3 = private unnamed_addr constant [3 x i8] c"r+\00", align 1
@.str.4 = private unnamed_addr constant [29 x i8] c"Could not open log file %s.\0A\00", align 1
@.str.5 = private unnamed_addr constant [70 x i8] c"421-Could not open file %s\0D\0A421 Server disabled for security reasons.\00", align 1
@user = external global [31 x i8], align 16
@remotehostname = external global i8*, align 8
@.str.6 = private unnamed_addr constant [2 x i8] c"*\00", align 1
@configpath = common global i8* null, align 8
@daemonmode = common global i32 0, align 4
@pre_write_script = common global i8* null, align 8
@post_write_script = common global i8* null, align 8

; Function Attrs: nounwind ssp uwtable
define void @bftpdutmp_create_dir(i8* %path_to_file) #0 !dbg !6 {
entry:
  %path_to_file.addr = alloca i8*, align 8
  %dir_name = alloca i8*, align 8
  %index = alloca i8*, align 8
  store i8* %path_to_file, i8** %path_to_file.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %path_to_file.addr, metadata !106, metadata !107), !dbg !108
  call void @llvm.dbg.declare(metadata i8** %dir_name, metadata !109, metadata !107), !dbg !110
  call void @llvm.dbg.declare(metadata i8** %index, metadata !111, metadata !107), !dbg !112
  %0 = load i8*, i8** %path_to_file.addr, align 8, !dbg !113
  %tobool = icmp ne i8* %0, null, !dbg !113
  br i1 %tobool, label %if.end, label %if.then, !dbg !115

if.then:                                          ; preds = %entry
  br label %return, !dbg !116

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %path_to_file.addr, align 8, !dbg !117
  %call = call i8* @strdup(i8* %1), !dbg !118
  store i8* %call, i8** %dir_name, align 8, !dbg !119
  %2 = load i8*, i8** %dir_name, align 8, !dbg !120
  %tobool1 = icmp ne i8* %2, null, !dbg !120
  br i1 %tobool1, label %if.end3, label %if.then2, !dbg !122

if.then2:                                         ; preds = %if.end
  br label %return, !dbg !123

if.end3:                                          ; preds = %if.end
  %3 = load i8*, i8** %dir_name, align 8, !dbg !124
  %call4 = call i8* @strrchr(i8* %3, i32 47), !dbg !125
  store i8* %call4, i8** %index, align 8, !dbg !126
  %4 = load i8*, i8** %index, align 8, !dbg !127
  %tobool5 = icmp ne i8* %4, null, !dbg !127
  br i1 %tobool5, label %if.then6, label %if.end8, !dbg !129

if.then6:                                         ; preds = %if.end3
  %5 = load i8*, i8** %index, align 8, !dbg !130
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 0, !dbg !130
  store i8 0, i8* %arrayidx, align 1, !dbg !132
  %6 = load i8*, i8** %dir_name, align 8, !dbg !133
  %call7 = call i32 (i8*, i32, ...) bitcast (i32 (...)* @mkdir to i32 (i8*, i32, ...)*)(i8* %6, i32 493), !dbg !134
  br label %if.end8, !dbg !135

if.end8:                                          ; preds = %if.then6, %if.end3
  %7 = load i8*, i8** %dir_name, align 8, !dbg !136
  call void @free(i8* %7), !dbg !137
  br label %return, !dbg !138

return:                                           ; preds = %if.end8, %if.then2, %if.then
  ret void, !dbg !138
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i8* @strdup(i8*) #2

declare i8* @strrchr(i8*, i32) #2

declare i32 @mkdir(...) #2

declare void @free(i8*) #2

; Function Attrs: nounwind ssp uwtable
define void @bftpdutmp_init() #0 !dbg !11 {
entry:
  %filename = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %filename, metadata !139, metadata !107), !dbg !140
  %call = call i8* @config_getoption(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str, i32 0, i32 0)), !dbg !141
  %call1 = call i8* @strdup(i8* %call), !dbg !142
  store i8* %call1, i8** %filename, align 8, !dbg !140
  %0 = load i8*, i8** %filename, align 8, !dbg !143
  %tobool = icmp ne i8* %0, null, !dbg !143
  br i1 %tobool, label %if.end, label %if.then, !dbg !145

if.then:                                          ; preds = %entry
  br label %return, !dbg !146

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %filename, align 8, !dbg !147
  %call2 = call i32 @strcasecmp(i8* %1, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i32 0, i32 0)), !dbg !149
  %tobool3 = icmp ne i32 %call2, 0, !dbg !149
  br i1 %tobool3, label %lor.lhs.false, label %if.then5, !dbg !150

lor.lhs.false:                                    ; preds = %if.end
  %2 = load i8*, i8** %filename, align 8, !dbg !151
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 0, !dbg !151
  %3 = load i8, i8* %arrayidx, align 1, !dbg !151
  %tobool4 = icmp ne i8 %3, 0, !dbg !151
  br i1 %tobool4, label %if.end6, label %if.then5, !dbg !152

if.then5:                                         ; preds = %lor.lhs.false, %if.end
  br label %return, !dbg !153

if.end6:                                          ; preds = %lor.lhs.false
  %4 = load i8*, i8** %filename, align 8, !dbg !154
  call void @bftpdutmp_create_dir(i8* %4), !dbg !155
  %5 = load i8*, i8** %filename, align 8, !dbg !156
  %call7 = call %struct.__sFILE* @"\01_fopen"(i8* %5, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i32 0, i32 0)), !dbg !157
  store %struct.__sFILE* %call7, %struct.__sFILE** @bftpdutmp, align 8, !dbg !158
  %6 = load %struct.__sFILE*, %struct.__sFILE** @bftpdutmp, align 8, !dbg !159
  %tobool8 = icmp ne %struct.__sFILE* %6, null, !dbg !159
  br i1 %tobool8, label %if.then9, label %if.end11, !dbg !161

if.then9:                                         ; preds = %if.end6
  %7 = load %struct.__sFILE*, %struct.__sFILE** @bftpdutmp, align 8, !dbg !162
  %call10 = call i32 @fclose(%struct.__sFILE* %7), !dbg !163
  br label %if.end11, !dbg !163

if.end11:                                         ; preds = %if.then9, %if.end6
  %8 = load i8*, i8** %filename, align 8, !dbg !164
  %call12 = call %struct.__sFILE* @"\01_fopen"(i8* %8, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i32 0, i32 0)), !dbg !166
  store %struct.__sFILE* %call12, %struct.__sFILE** @bftpdutmp, align 8, !dbg !167
  %tobool13 = icmp ne %struct.__sFILE* %call12, null, !dbg !167
  br i1 %tobool13, label %if.end15, label %if.then14, !dbg !168

if.then14:                                        ; preds = %if.end11
  %9 = load i8*, i8** %filename, align 8, !dbg !169
  call void (i8*, ...) @bftpd_log(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.4, i32 0, i32 0), i8* %9), !dbg !171
  %10 = load i8*, i8** %filename, align 8, !dbg !172
  call void (i8, i8*, ...) @control_printf(i8 signext 2, i8* getelementptr inbounds ([70 x i8], [70 x i8]* @.str.5, i32 0, i32 0), i8* %10), !dbg !173
  call void @exit(i32 1) #6, !dbg !174
  unreachable, !dbg !174

if.end15:                                         ; preds = %if.end11
  %11 = load %struct.__sFILE*, %struct.__sFILE** @bftpdutmp, align 8, !dbg !175
  call void @rewind(%struct.__sFILE* %11), !dbg !176
  %12 = load i8*, i8** %filename, align 8, !dbg !177
  call void @free(i8* %12), !dbg !178
  br label %return, !dbg !179

return:                                           ; preds = %if.end15, %if.then5, %if.then
  ret void, !dbg !179
}

declare i8* @config_getoption(i8*) #2

declare i32 @strcasecmp(i8*, i8*) #2

declare %struct.__sFILE* @"\01_fopen"(i8*, i8*) #2

declare i32 @fclose(%struct.__sFILE*) #2

declare void @bftpd_log(i8*, ...) #2

declare void @control_printf(i8 signext, i8*, ...) #2

; Function Attrs: noreturn
declare void @exit(i32) #3

declare void @rewind(%struct.__sFILE*) #2

; Function Attrs: nounwind ssp uwtable
define void @bftpdutmp_end() #0 !dbg !14 {
entry:
  %0 = load %struct.__sFILE*, %struct.__sFILE** @bftpdutmp, align 8, !dbg !180
  %tobool = icmp ne %struct.__sFILE* %0, null, !dbg !180
  br i1 %tobool, label %if.then, label %if.end2, !dbg !182

if.then:                                          ; preds = %entry
  %1 = load i64, i64* @bftpdutmp_offset, align 8, !dbg !183
  %cmp = icmp ne i64 %1, -1, !dbg !186
  br i1 %cmp, label %if.then1, label %if.end, !dbg !187

if.then1:                                         ; preds = %if.then
  call void @bftpdutmp_log(i8 signext 0), !dbg !188
  br label %if.end, !dbg !188

if.end:                                           ; preds = %if.then1, %if.then
  %2 = load %struct.__sFILE*, %struct.__sFILE** @bftpdutmp, align 8, !dbg !189
  %call = call i32 @fclose(%struct.__sFILE* %2), !dbg !190
  store %struct.__sFILE* null, %struct.__sFILE** @bftpdutmp, align 8, !dbg !191
  br label %if.end2, !dbg !192

if.end2:                                          ; preds = %if.end, %entry
  ret void, !dbg !193
}

; Function Attrs: nounwind ssp uwtable
define void @bftpdutmp_log(i8 signext %type) #0 !dbg !15 {
entry:
  %type.addr = alloca i8, align 1
  %ut = alloca %struct.bftpdutmp, align 8
  %tmp = alloca %struct.bftpdutmp, align 8
  %i = alloca i64, align 8
  %max_length = alloca i32, align 4
  store i8 %type, i8* %type.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %type.addr, metadata !194, metadata !107), !dbg !195
  call void @llvm.dbg.declare(metadata %struct.bftpdutmp* %ut, metadata !196, metadata !107), !dbg !214
  call void @llvm.dbg.declare(metadata %struct.bftpdutmp* %tmp, metadata !215, metadata !107), !dbg !216
  call void @llvm.dbg.declare(metadata i64* %i, metadata !217, metadata !107), !dbg !218
  call void @llvm.dbg.declare(metadata i32* %max_length, metadata !219, metadata !107), !dbg !220
  %0 = load %struct.__sFILE*, %struct.__sFILE** @bftpdutmp, align 8, !dbg !221
  %tobool = icmp ne %struct.__sFILE* %0, null, !dbg !221
  br i1 %tobool, label %if.end, label %if.then, !dbg !223

if.then:                                          ; preds = %entry
  br label %return, !dbg !224

if.end:                                           ; preds = %entry
  %1 = bitcast %struct.bftpdutmp* %ut to i8*, !dbg !225
  call void @llvm.memset.p0i8.i64(i8* %1, i8 0, i64 304, i32 8, i1 false), !dbg !225
  %call = call i32 @getpid(), !dbg !226
  %bu_pid = getelementptr inbounds %struct.bftpdutmp, %struct.bftpdutmp* %ut, i32 0, i32 1, !dbg !227
  store i32 %call, i32* %bu_pid, align 4, !dbg !228
  %2 = load i8, i8* %type.addr, align 1, !dbg !229
  %tobool3 = icmp ne i8 %2, 0, !dbg !229
  br i1 %tobool3, label %if.then4, label %if.else, !dbg !231

if.then4:                                         ; preds = %if.end
  %bu_type = getelementptr inbounds %struct.bftpdutmp, %struct.bftpdutmp* %ut, i32 0, i32 0, !dbg !232
  store i8 1, i8* %bu_type, align 8, !dbg !234
  %bu_name = getelementptr inbounds %struct.bftpdutmp, %struct.bftpdutmp* %ut, i32 0, i32 2, !dbg !235
  %arraydecay = getelementptr inbounds [31 x i8], [31 x i8]* %bu_name, i32 0, i32 0, !dbg !235
  %call5 = call i8* @__strncpy_chk(i8* %arraydecay, i8* getelementptr inbounds ([31 x i8], [31 x i8]* @user, i32 0, i32 0), i64 31, i64 31) #7, !dbg !235
  store i32 256, i32* %max_length, align 4, !dbg !236
  %bu_host = getelementptr inbounds %struct.bftpdutmp, %struct.bftpdutmp* %ut, i32 0, i32 3, !dbg !237
  %arraydecay6 = getelementptr inbounds [256 x i8], [256 x i8]* %bu_host, i32 0, i32 0, !dbg !237
  %3 = load i8*, i8** @remotehostname, align 8, !dbg !237
  %4 = load i32, i32* %max_length, align 4, !dbg !237
  %conv = sext i32 %4 to i64, !dbg !237
  %call7 = call i8* @__strncpy_chk(i8* %arraydecay6, i8* %3, i64 %conv, i64 256) #7, !dbg !237
  %5 = load i32, i32* %max_length, align 4, !dbg !238
  %sub = sub nsw i32 %5, 1, !dbg !239
  %idxprom = sext i32 %sub to i64, !dbg !240
  %bu_host8 = getelementptr inbounds %struct.bftpdutmp, %struct.bftpdutmp* %ut, i32 0, i32 3, !dbg !241
  %arrayidx = getelementptr inbounds [256 x i8], [256 x i8]* %bu_host8, i64 0, i64 %idxprom, !dbg !240
  store i8 0, i8* %arrayidx, align 1, !dbg !242
  %6 = load %struct.__sFILE*, %struct.__sFILE** @bftpdutmp, align 8, !dbg !243
  call void @rewind(%struct.__sFILE* %6), !dbg !244
  store i64 0, i64* %i, align 8, !dbg !245
  br label %while.cond, !dbg !246

while.cond:                                       ; preds = %if.end14, %if.then4
  %7 = bitcast %struct.bftpdutmp* %tmp to i8*, !dbg !247
  %8 = load %struct.__sFILE*, %struct.__sFILE** @bftpdutmp, align 8, !dbg !248
  %call9 = call i64 @fread(i8* %7, i64 304, i64 1, %struct.__sFILE* %8), !dbg !249
  %tobool10 = icmp ne i64 %call9, 0, !dbg !246
  br i1 %tobool10, label %while.body, label %while.end, !dbg !246

while.body:                                       ; preds = %while.cond
  %bu_type11 = getelementptr inbounds %struct.bftpdutmp, %struct.bftpdutmp* %tmp, i32 0, i32 0, !dbg !250
  %9 = load i8, i8* %bu_type11, align 8, !dbg !250
  %tobool12 = icmp ne i8 %9, 0, !dbg !253
  br i1 %tobool12, label %if.end14, label %if.then13, !dbg !254

if.then13:                                        ; preds = %while.body
  br label %while.end, !dbg !255

if.end14:                                         ; preds = %while.body
  %10 = load i64, i64* %i, align 8, !dbg !256
  %inc = add nsw i64 %10, 1, !dbg !256
  store i64 %inc, i64* %i, align 8, !dbg !256
  br label %while.cond, !dbg !246

while.end:                                        ; preds = %if.then13, %while.cond
  %11 = load i64, i64* %i, align 8, !dbg !257
  %mul = mul i64 %11, 304, !dbg !258
  store i64 %mul, i64* @bftpdutmp_offset, align 8, !dbg !259
  br label %if.end16, !dbg !260

if.else:                                          ; preds = %if.end
  %bu_type15 = getelementptr inbounds %struct.bftpdutmp, %struct.bftpdutmp* %ut, i32 0, i32 0, !dbg !261
  store i8 0, i8* %bu_type15, align 8, !dbg !262
  br label %if.end16

if.end16:                                         ; preds = %if.else, %while.end
  %bu_time = getelementptr inbounds %struct.bftpdutmp, %struct.bftpdutmp* %ut, i32 0, i32 4, !dbg !263
  %call17 = call i64 @time(i64* %bu_time), !dbg !264
  %12 = load %struct.__sFILE*, %struct.__sFILE** @bftpdutmp, align 8, !dbg !265
  %13 = load i64, i64* @bftpdutmp_offset, align 8, !dbg !266
  %call18 = call i32 @fseek(%struct.__sFILE* %12, i64 %13, i32 0), !dbg !267
  %14 = bitcast %struct.bftpdutmp* %ut to i8*, !dbg !268
  %15 = load %struct.__sFILE*, %struct.__sFILE** @bftpdutmp, align 8, !dbg !269
  %call19 = call i64 @"\01_fwrite"(i8* %14, i64 304, i64 1, %struct.__sFILE* %15), !dbg !270
  %16 = load %struct.__sFILE*, %struct.__sFILE** @bftpdutmp, align 8, !dbg !271
  %call20 = call i32 @fflush(%struct.__sFILE* %16), !dbg !272
  br label %return, !dbg !273

return:                                           ; preds = %if.end16, %if.then
  ret void, !dbg !273
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #4

declare i32 @getpid() #2

; Function Attrs: nounwind
declare i8* @__strncpy_chk(i8*, i8*, i64, i64) #5

declare i64 @fread(i8*, i64, i64, %struct.__sFILE*) #2

declare i64 @time(i64*) #2

declare i32 @fseek(%struct.__sFILE*, i64, i32) #2

declare i64 @"\01_fwrite"(i8*, i64, i64, %struct.__sFILE*) #2

declare i32 @fflush(%struct.__sFILE*) #2

; Function Attrs: nounwind ssp uwtable
define signext i8 @bftpdutmp_pidexists(i32 %pid) #0 !dbg !18 {
entry:
  %retval = alloca i8, align 1
  %pid.addr = alloca i32, align 4
  %tmp = alloca %struct.bftpdutmp, align 8
  store i32 %pid, i32* %pid.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %pid.addr, metadata !274, metadata !107), !dbg !275
  call void @llvm.dbg.declare(metadata %struct.bftpdutmp* %tmp, metadata !276, metadata !107), !dbg !277
  %0 = load %struct.__sFILE*, %struct.__sFILE** @bftpdutmp, align 8, !dbg !278
  %tobool = icmp ne %struct.__sFILE* %0, null, !dbg !278
  br i1 %tobool, label %if.end, label %if.then, !dbg !280

if.then:                                          ; preds = %entry
  store i8 0, i8* %retval, align 1, !dbg !281
  br label %return, !dbg !281

if.end:                                           ; preds = %entry
  %1 = load %struct.__sFILE*, %struct.__sFILE** @bftpdutmp, align 8, !dbg !282
  call void @rewind(%struct.__sFILE* %1), !dbg !283
  br label %while.cond, !dbg !284

while.cond:                                       ; preds = %if.end4, %if.end
  %2 = bitcast %struct.bftpdutmp* %tmp to i8*, !dbg !285
  %3 = load %struct.__sFILE*, %struct.__sFILE** @bftpdutmp, align 8, !dbg !286
  %call = call i64 @fread(i8* %2, i64 304, i64 1, %struct.__sFILE* %3), !dbg !287
  %tobool1 = icmp ne i64 %call, 0, !dbg !284
  br i1 %tobool1, label %while.body, label %while.end, !dbg !284

while.body:                                       ; preds = %while.cond
  %bu_pid = getelementptr inbounds %struct.bftpdutmp, %struct.bftpdutmp* %tmp, i32 0, i32 1, !dbg !288
  %4 = load i32, i32* %bu_pid, align 4, !dbg !288
  %5 = load i32, i32* %pid.addr, align 4, !dbg !291
  %cmp = icmp eq i32 %4, %5, !dbg !292
  br i1 %cmp, label %land.lhs.true, label %if.end4, !dbg !293

land.lhs.true:                                    ; preds = %while.body
  %bu_type = getelementptr inbounds %struct.bftpdutmp, %struct.bftpdutmp* %tmp, i32 0, i32 0, !dbg !294
  %6 = load i8, i8* %bu_type, align 8, !dbg !294
  %conv = sext i8 %6 to i32, !dbg !295
  %tobool2 = icmp ne i32 %conv, 0, !dbg !295
  br i1 %tobool2, label %if.then3, label %if.end4, !dbg !296

if.then3:                                         ; preds = %land.lhs.true
  store i8 1, i8* %retval, align 1, !dbg !297
  br label %return, !dbg !297

if.end4:                                          ; preds = %land.lhs.true, %while.body
  br label %while.cond, !dbg !284

while.end:                                        ; preds = %while.cond
  store i8 0, i8* %retval, align 1, !dbg !298
  br label %return, !dbg !298

return:                                           ; preds = %while.end, %if.then3, %if.then
  %7 = load i8, i8* %retval, align 1, !dbg !299
  ret i8 %7, !dbg !299
}

; Function Attrs: nounwind ssp uwtable
define i32 @bftpdutmp_usercount(i8* %username) #0 !dbg !28 {
entry:
  %retval = alloca i32, align 4
  %username.addr = alloca i8*, align 8
  %tmp = alloca %struct.bftpdutmp, align 8
  %count = alloca i32, align 4
  store i8* %username, i8** %username.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %username.addr, metadata !300, metadata !107), !dbg !301
  call void @llvm.dbg.declare(metadata %struct.bftpdutmp* %tmp, metadata !302, metadata !107), !dbg !303
  call void @llvm.dbg.declare(metadata i32* %count, metadata !304, metadata !107), !dbg !305
  store i32 0, i32* %count, align 4, !dbg !305
  %0 = load %struct.__sFILE*, %struct.__sFILE** @bftpdutmp, align 8, !dbg !306
  %tobool = icmp ne %struct.__sFILE* %0, null, !dbg !306
  br i1 %tobool, label %if.end, label %if.then, !dbg !308

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !309
  br label %return, !dbg !309

if.end:                                           ; preds = %entry
  %1 = load %struct.__sFILE*, %struct.__sFILE** @bftpdutmp, align 8, !dbg !310
  call void @rewind(%struct.__sFILE* %1), !dbg !311
  br label %while.cond, !dbg !312

while.cond:                                       ; preds = %if.end9, %if.end
  %2 = bitcast %struct.bftpdutmp* %tmp to i8*, !dbg !313
  %3 = load %struct.__sFILE*, %struct.__sFILE** @bftpdutmp, align 8, !dbg !314
  %call = call i64 @fread(i8* %2, i64 304, i64 1, %struct.__sFILE* %3), !dbg !315
  %tobool2 = icmp ne i64 %call, 0, !dbg !312
  br i1 %tobool2, label %while.body, label %while.end, !dbg !312

while.body:                                       ; preds = %while.cond
  %bu_type = getelementptr inbounds %struct.bftpdutmp, %struct.bftpdutmp* %tmp, i32 0, i32 0, !dbg !316
  %4 = load i8, i8* %bu_type, align 8, !dbg !316
  %conv = sext i8 %4 to i32, !dbg !319
  %tobool3 = icmp ne i32 %conv, 0, !dbg !319
  br i1 %tobool3, label %land.lhs.true, label %if.end9, !dbg !320

land.lhs.true:                                    ; preds = %while.body
  %bu_name = getelementptr inbounds %struct.bftpdutmp, %struct.bftpdutmp* %tmp, i32 0, i32 2, !dbg !321
  %arraydecay = getelementptr inbounds [31 x i8], [31 x i8]* %bu_name, i32 0, i32 0, !dbg !322
  %5 = load i8*, i8** %username.addr, align 8, !dbg !323
  %call4 = call i32 @strcmp(i8* %arraydecay, i8* %5), !dbg !324
  %tobool5 = icmp ne i32 %call4, 0, !dbg !324
  br i1 %tobool5, label %lor.lhs.false, label %if.then8, !dbg !325

lor.lhs.false:                                    ; preds = %land.lhs.true
  %6 = load i8*, i8** %username.addr, align 8, !dbg !326
  %call6 = call i32 @strcmp(i8* %6, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.6, i32 0, i32 0)), !dbg !327
  %tobool7 = icmp ne i32 %call6, 0, !dbg !327
  br i1 %tobool7, label %if.end9, label %if.then8, !dbg !328

if.then8:                                         ; preds = %lor.lhs.false, %land.lhs.true
  %7 = load i32, i32* %count, align 4, !dbg !329
  %inc = add nsw i32 %7, 1, !dbg !329
  store i32 %inc, i32* %count, align 4, !dbg !329
  br label %if.end9, !dbg !330

if.end9:                                          ; preds = %if.then8, %lor.lhs.false, %while.body
  br label %while.cond, !dbg !312

while.end:                                        ; preds = %while.cond
  %8 = load i32, i32* %count, align 4, !dbg !331
  %cmp = icmp slt i32 %8, 0, !dbg !333
  br i1 %cmp, label %if.then11, label %if.end12, !dbg !334

if.then11:                                        ; preds = %while.end
  store i32 1, i32* %count, align 4, !dbg !335
  br label %if.end12, !dbg !336

if.end12:                                         ; preds = %if.then11, %while.end
  %9 = load i32, i32* %count, align 4, !dbg !337
  store i32 %9, i32* %retval, align 4, !dbg !338
  br label %return, !dbg !338

return:                                           ; preds = %if.end12, %if.then
  %10 = load i32, i32* %retval, align 4, !dbg !339
  ret i32 %10, !dbg !339
}

declare i32 @strcmp(i8*, i8*) #2

; Function Attrs: nounwind ssp uwtable
define i32 @bftpdutmp_dup_ip_count(i8* %ip_address) #0 !dbg !31 {
entry:
  %retval = alloca i32, align 4
  %ip_address.addr = alloca i8*, align 8
  %tmp = alloca %struct.bftpdutmp, align 8
  %count = alloca i32, align 4
  store i8* %ip_address, i8** %ip_address.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %ip_address.addr, metadata !340, metadata !107), !dbg !341
  call void @llvm.dbg.declare(metadata %struct.bftpdutmp* %tmp, metadata !342, metadata !107), !dbg !343
  call void @llvm.dbg.declare(metadata i32* %count, metadata !344, metadata !107), !dbg !345
  store i32 0, i32* %count, align 4, !dbg !345
  %0 = load %struct.__sFILE*, %struct.__sFILE** @bftpdutmp, align 8, !dbg !346
  %tobool = icmp ne %struct.__sFILE* %0, null, !dbg !346
  br i1 %tobool, label %if.end, label %if.then, !dbg !348

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !349
  br label %return, !dbg !349

if.end:                                           ; preds = %entry
  %1 = load %struct.__sFILE*, %struct.__sFILE** @bftpdutmp, align 8, !dbg !350
  call void @rewind(%struct.__sFILE* %1), !dbg !351
  br label %while.cond, !dbg !352

while.cond:                                       ; preds = %if.end7, %if.end
  %2 = bitcast %struct.bftpdutmp* %tmp to i8*, !dbg !353
  %3 = load %struct.__sFILE*, %struct.__sFILE** @bftpdutmp, align 8, !dbg !354
  %call = call i64 @fread(i8* %2, i64 304, i64 1, %struct.__sFILE* %3), !dbg !355
  %tobool2 = icmp ne i64 %call, 0, !dbg !352
  br i1 %tobool2, label %while.body, label %while.end, !dbg !352

while.body:                                       ; preds = %while.cond
  %bu_type = getelementptr inbounds %struct.bftpdutmp, %struct.bftpdutmp* %tmp, i32 0, i32 0, !dbg !356
  %4 = load i8, i8* %bu_type, align 8, !dbg !356
  %conv = sext i8 %4 to i32, !dbg !359
  %tobool3 = icmp ne i32 %conv, 0, !dbg !359
  br i1 %tobool3, label %land.lhs.true, label %if.end7, !dbg !360

land.lhs.true:                                    ; preds = %while.body
  %bu_host = getelementptr inbounds %struct.bftpdutmp, %struct.bftpdutmp* %tmp, i32 0, i32 3, !dbg !361
  %arraydecay = getelementptr inbounds [256 x i8], [256 x i8]* %bu_host, i32 0, i32 0, !dbg !362
  %5 = load i8*, i8** %ip_address.addr, align 8, !dbg !363
  %call4 = call i32 @strcmp(i8* %arraydecay, i8* %5), !dbg !364
  %tobool5 = icmp ne i32 %call4, 0, !dbg !364
  br i1 %tobool5, label %if.end7, label %if.then6, !dbg !365

if.then6:                                         ; preds = %land.lhs.true
  %6 = load i32, i32* %count, align 4, !dbg !366
  %inc = add nsw i32 %6, 1, !dbg !366
  store i32 %inc, i32* %count, align 4, !dbg !366
  br label %if.end7, !dbg !367

if.end7:                                          ; preds = %if.then6, %land.lhs.true, %while.body
  br label %while.cond, !dbg !352

while.end:                                        ; preds = %while.cond
  %7 = load i32, i32* %count, align 4, !dbg !368
  store i32 %7, i32* %retval, align 4, !dbg !369
  br label %return, !dbg !369

return:                                           ; preds = %while.end, %if.then
  %8 = load i32, i32* %retval, align 4, !dbg !370
  ret i32 %8, !dbg !370
}

; Function Attrs: nounwind ssp uwtable
define void @bftpdutmp_remove_pid(i32 %pid) #0 !dbg !32 {
entry:
  %pid.addr = alloca i32, align 4
  %current = alloca %struct.bftpdutmp, align 8
  %index = alloca i32, align 4
  store i32 %pid, i32* %pid.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %pid.addr, metadata !371, metadata !107), !dbg !372
  call void @llvm.dbg.declare(metadata %struct.bftpdutmp* %current, metadata !373, metadata !107), !dbg !374
  call void @llvm.dbg.declare(metadata i32* %index, metadata !375, metadata !107), !dbg !376
  store i32 0, i32* %index, align 4, !dbg !376
  %0 = load %struct.__sFILE*, %struct.__sFILE** @bftpdutmp, align 8, !dbg !377
  %tobool = icmp ne %struct.__sFILE* %0, null, !dbg !377
  br i1 %tobool, label %if.end, label %if.then, !dbg !379

if.then:                                          ; preds = %entry
  br label %while.end, !dbg !380

if.end:                                           ; preds = %entry
  %1 = load %struct.__sFILE*, %struct.__sFILE** @bftpdutmp, align 8, !dbg !381
  call void @rewind(%struct.__sFILE* %1), !dbg !382
  br label %while.cond, !dbg !383

while.cond:                                       ; preds = %if.end5, %if.end
  %2 = bitcast %struct.bftpdutmp* %current to i8*, !dbg !384
  %3 = load %struct.__sFILE*, %struct.__sFILE** @bftpdutmp, align 8, !dbg !385
  %call = call i64 @fread(i8* %2, i64 304, i64 1, %struct.__sFILE* %3), !dbg !386
  %tobool1 = icmp ne i64 %call, 0, !dbg !383
  br i1 %tobool1, label %while.body, label %while.end, !dbg !383

while.body:                                       ; preds = %while.cond
  %bu_pid = getelementptr inbounds %struct.bftpdutmp, %struct.bftpdutmp* %current, i32 0, i32 1, !dbg !387
  %4 = load i32, i32* %bu_pid, align 4, !dbg !387
  %5 = load i32, i32* %pid.addr, align 4, !dbg !390
  %cmp = icmp eq i32 %4, %5, !dbg !391
  br i1 %cmp, label %if.then2, label %if.end5, !dbg !392

if.then2:                                         ; preds = %while.body
  %6 = load %struct.__sFILE*, %struct.__sFILE** @bftpdutmp, align 8, !dbg !393
  %7 = load i32, i32* %index, align 4, !dbg !395
  %conv = sext i32 %7 to i64, !dbg !395
  %mul = mul i64 %conv, 304, !dbg !396
  %call3 = call i32 @fseek(%struct.__sFILE* %6, i64 %mul, i32 0), !dbg !397
  %8 = bitcast %struct.bftpdutmp* %current to i8*, !dbg !398
  call void @llvm.memset.p0i8.i64(i8* %8, i8 0, i64 304, i32 8, i1 false), !dbg !398
  %9 = bitcast %struct.bftpdutmp* %current to i8*, !dbg !399
  %10 = load %struct.__sFILE*, %struct.__sFILE** @bftpdutmp, align 8, !dbg !400
  %call4 = call i64 @"\01_fwrite"(i8* %9, i64 304, i64 1, %struct.__sFILE* %10), !dbg !401
  br label %if.end5, !dbg !402

if.end5:                                          ; preds = %if.then2, %while.body
  %11 = load i32, i32* %index, align 4, !dbg !403
  %inc = add nsw i32 %11, 1, !dbg !403
  store i32 %inc, i32* %index, align 4, !dbg !403
  br label %while.cond, !dbg !383

while.end:                                        ; preds = %if.then, %while.cond
  ret void, !dbg !404
}

attributes #0 = { nounwind ssp uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="core2" "target-features"="+cx16,+fxsr,+mmx,+sse,+sse2,+sse3,+ssse3" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="core2" "target-features"="+cx16,+fxsr,+mmx,+sse,+sse2,+sse3,+ssse3" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="core2" "target-features"="+cx16,+fxsr,+mmx,+sse,+sse2,+sse3,+ssse3" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { argmemonly nounwind }
attributes #5 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="core2" "target-features"="+cx16,+fxsr,+mmx,+sse,+sse2,+sse3,+ssse3" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { noreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!102, !103, !104}
!llvm.ident = !{!105}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.8.0 (tags/RELEASE_380/final)", isOptimized: false, runtimeVersion: 0, emissionKind: 1, enums: !2, retainedTypes: !3, subprograms: !5, globals: !35)
!1 = !DIFile(filename: "/Users/zhouyangjia/llvm-3.8.0.src/tools/clang/tools/clang-loggrad/test/bftpd/bftpdutmp.c", directory: "/Users/zhouyangjia/llvm-3.8.0.src/tools/clang/tools/clang-loggrad/test/bftpd")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!5 = !{!6, !11, !14, !15, !18, !28, !31, !32}
!6 = distinct !DISubprogram(name: "bftpdutmp_create_dir", scope: !1, file: !1, line: 17, type: !7, isLocal: false, isDefinition: true, scopeLine: 18, flags: DIFlagPrototyped, isOptimized: false, variables: !2)
!7 = !DISubroutineType(types: !8)
!8 = !{null, !9}
!9 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !10, size: 64, align: 64)
!10 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!11 = distinct !DISubprogram(name: "bftpdutmp_init", scope: !1, file: !1, line: 38, type: !12, isLocal: false, isDefinition: true, scopeLine: 39, isOptimized: false, variables: !2)
!12 = !DISubroutineType(types: !13)
!13 = !{null}
!14 = distinct !DISubprogram(name: "bftpdutmp_end", scope: !1, file: !1, line: 67, type: !12, isLocal: false, isDefinition: true, scopeLine: 68, isOptimized: false, variables: !2)
!15 = distinct !DISubprogram(name: "bftpdutmp_log", scope: !1, file: !1, line: 77, type: !16, isLocal: false, isDefinition: true, scopeLine: 78, flags: DIFlagPrototyped, isOptimized: false, variables: !2)
!16 = !DISubroutineType(types: !17)
!17 = !{null, !10}
!18 = distinct !DISubprogram(name: "bftpdutmp_pidexists", scope: !1, file: !1, line: 113, type: !19, isLocal: false, isDefinition: true, scopeLine: 114, flags: DIFlagPrototyped, isOptimized: false, variables: !2)
!19 = !DISubroutineType(types: !20)
!20 = !{!10, !21}
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "pid_t", file: !22, line: 30, baseType: !23)
!22 = !DIFile(filename: "/usr/include/sys/_types/_pid_t.h", directory: "/Users/zhouyangjia/llvm-3.8.0.src/tools/clang/tools/clang-loggrad/test/bftpd")
!23 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_pid_t", file: !24, line: 72, baseType: !25)
!24 = !DIFile(filename: "/usr/include/sys/_types.h", directory: "/Users/zhouyangjia/llvm-3.8.0.src/tools/clang/tools/clang-loggrad/test/bftpd")
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int32_t", file: !26, line: 44, baseType: !27)
!26 = !DIFile(filename: "/usr/include/i386/_types.h", directory: "/Users/zhouyangjia/llvm-3.8.0.src/tools/clang/tools/clang-loggrad/test/bftpd")
!27 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!28 = distinct !DISubprogram(name: "bftpdutmp_usercount", scope: !1, file: !1, line: 126, type: !29, isLocal: false, isDefinition: true, scopeLine: 127, flags: DIFlagPrototyped, isOptimized: false, variables: !2)
!29 = !DISubroutineType(types: !30)
!30 = !{!27, !9}
!31 = distinct !DISubprogram(name: "bftpdutmp_dup_ip_count", scope: !1, file: !1, line: 147, type: !29, isLocal: false, isDefinition: true, scopeLine: 148, flags: DIFlagPrototyped, isOptimized: false, variables: !2)
!32 = distinct !DISubprogram(name: "bftpdutmp_remove_pid", scope: !1, file: !1, line: 176, type: !33, isLocal: false, isDefinition: true, scopeLine: 177, flags: DIFlagPrototyped, isOptimized: false, variables: !2)
!33 = !DISubroutineType(types: !34)
!34 = !{null, !27}
!35 = !{!36, !95, !97, !99, !100, !101}
!36 = !DIGlobalVariable(name: "bftpdutmp", scope: !0, file: !1, line: 14, type: !37, isLocal: false, isDefinition: true, variable: %struct.__sFILE** @bftpdutmp)
!37 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !38, size: 64, align: 64)
!38 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !39, line: 153, baseType: !40)
!39 = !DIFile(filename: "/usr/include/stdio.h", directory: "/Users/zhouyangjia/llvm-3.8.0.src/tools/clang/tools/clang-loggrad/test/bftpd")
!40 = !DICompositeType(tag: DW_TAG_structure_type, name: "__sFILE", file: !39, line: 122, size: 1216, align: 64, elements: !41)
!41 = !{!42, !45, !46, !47, !49, !50, !55, !56, !57, !61, !65, !73, !79, !80, !83, !84, !88, !92, !93, !94}
!42 = !DIDerivedType(tag: DW_TAG_member, name: "_p", scope: !40, file: !39, line: 123, baseType: !43, size: 64, align: 64)
!43 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !44, size: 64, align: 64)
!44 = !DIBasicType(name: "unsigned char", size: 8, align: 8, encoding: DW_ATE_unsigned_char)
!45 = !DIDerivedType(tag: DW_TAG_member, name: "_r", scope: !40, file: !39, line: 124, baseType: !27, size: 32, align: 32, offset: 64)
!46 = !DIDerivedType(tag: DW_TAG_member, name: "_w", scope: !40, file: !39, line: 125, baseType: !27, size: 32, align: 32, offset: 96)
!47 = !DIDerivedType(tag: DW_TAG_member, name: "_flags", scope: !40, file: !39, line: 126, baseType: !48, size: 16, align: 16, offset: 128)
!48 = !DIBasicType(name: "short", size: 16, align: 16, encoding: DW_ATE_signed)
!49 = !DIDerivedType(tag: DW_TAG_member, name: "_file", scope: !40, file: !39, line: 127, baseType: !48, size: 16, align: 16, offset: 144)
!50 = !DIDerivedType(tag: DW_TAG_member, name: "_bf", scope: !40, file: !39, line: 128, baseType: !51, size: 128, align: 64, offset: 192)
!51 = !DICompositeType(tag: DW_TAG_structure_type, name: "__sbuf", file: !39, line: 88, size: 128, align: 64, elements: !52)
!52 = !{!53, !54}
!53 = !DIDerivedType(tag: DW_TAG_member, name: "_base", scope: !51, file: !39, line: 89, baseType: !43, size: 64, align: 64)
!54 = !DIDerivedType(tag: DW_TAG_member, name: "_size", scope: !51, file: !39, line: 90, baseType: !27, size: 32, align: 32, offset: 64)
!55 = !DIDerivedType(tag: DW_TAG_member, name: "_lbfsize", scope: !40, file: !39, line: 129, baseType: !27, size: 32, align: 32, offset: 320)
!56 = !DIDerivedType(tag: DW_TAG_member, name: "_cookie", scope: !40, file: !39, line: 132, baseType: !4, size: 64, align: 64, offset: 384)
!57 = !DIDerivedType(tag: DW_TAG_member, name: "_close", scope: !40, file: !39, line: 133, baseType: !58, size: 64, align: 64, offset: 448)
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !59, size: 64, align: 64)
!59 = !DISubroutineType(types: !60)
!60 = !{!27, !4}
!61 = !DIDerivedType(tag: DW_TAG_member, name: "_read", scope: !40, file: !39, line: 134, baseType: !62, size: 64, align: 64, offset: 512)
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !63, size: 64, align: 64)
!63 = !DISubroutineType(types: !64)
!64 = !{!27, !4, !9, !27}
!65 = !DIDerivedType(tag: DW_TAG_member, name: "_seek", scope: !40, file: !39, line: 135, baseType: !66, size: 64, align: 64, offset: 576)
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !67, size: 64, align: 64)
!67 = !DISubroutineType(types: !68)
!68 = !{!69, !4, !69, !27}
!69 = !DIDerivedType(tag: DW_TAG_typedef, name: "fpos_t", file: !39, line: 77, baseType: !70)
!70 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_off_t", file: !24, line: 71, baseType: !71)
!71 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !26, line: 46, baseType: !72)
!72 = !DIBasicType(name: "long long int", size: 64, align: 64, encoding: DW_ATE_signed)
!73 = !DIDerivedType(tag: DW_TAG_member, name: "_write", scope: !40, file: !39, line: 136, baseType: !74, size: 64, align: 64, offset: 640)
!74 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !75, size: 64, align: 64)
!75 = !DISubroutineType(types: !76)
!76 = !{!27, !4, !77, !27}
!77 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !78, size: 64, align: 64)
!78 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !10)
!79 = !DIDerivedType(tag: DW_TAG_member, name: "_ub", scope: !40, file: !39, line: 139, baseType: !51, size: 128, align: 64, offset: 704)
!80 = !DIDerivedType(tag: DW_TAG_member, name: "_extra", scope: !40, file: !39, line: 140, baseType: !81, size: 64, align: 64, offset: 832)
!81 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !82, size: 64, align: 64)
!82 = !DICompositeType(tag: DW_TAG_structure_type, name: "__sFILEX", file: !39, line: 94, flags: DIFlagFwdDecl)
!83 = !DIDerivedType(tag: DW_TAG_member, name: "_ur", scope: !40, file: !39, line: 141, baseType: !27, size: 32, align: 32, offset: 896)
!84 = !DIDerivedType(tag: DW_TAG_member, name: "_ubuf", scope: !40, file: !39, line: 144, baseType: !85, size: 24, align: 8, offset: 928)
!85 = !DICompositeType(tag: DW_TAG_array_type, baseType: !44, size: 24, align: 8, elements: !86)
!86 = !{!87}
!87 = !DISubrange(count: 3)
!88 = !DIDerivedType(tag: DW_TAG_member, name: "_nbuf", scope: !40, file: !39, line: 145, baseType: !89, size: 8, align: 8, offset: 952)
!89 = !DICompositeType(tag: DW_TAG_array_type, baseType: !44, size: 8, align: 8, elements: !90)
!90 = !{!91}
!91 = !DISubrange(count: 1)
!92 = !DIDerivedType(tag: DW_TAG_member, name: "_lb", scope: !40, file: !39, line: 148, baseType: !51, size: 128, align: 64, offset: 960)
!93 = !DIDerivedType(tag: DW_TAG_member, name: "_blksize", scope: !40, file: !39, line: 151, baseType: !27, size: 32, align: 32, offset: 1088)
!94 = !DIDerivedType(tag: DW_TAG_member, name: "_offset", scope: !40, file: !39, line: 152, baseType: !69, size: 64, align: 64, offset: 1152)
!95 = !DIGlobalVariable(name: "bftpdutmp_offset", scope: !0, file: !1, line: 15, type: !96, isLocal: false, isDefinition: true, variable: i64* @bftpdutmp_offset)
!96 = !DIBasicType(name: "long int", size: 64, align: 64, encoding: DW_ATE_signed)
!97 = !DIGlobalVariable(name: "configpath", scope: !0, file: !98, line: 25, type: !9, isLocal: false, isDefinition: true, variable: i8** @configpath)
!98 = !DIFile(filename: "/Users/zhouyangjia/llvm-3.8.0.src/tools/clang/tools/clang-loggrad/test/bftpd/main.h", directory: "/Users/zhouyangjia/llvm-3.8.0.src/tools/clang/tools/clang-loggrad/test/bftpd")
!99 = !DIGlobalVariable(name: "daemonmode", scope: !0, file: !98, line: 26, type: !27, isLocal: false, isDefinition: true, variable: i32* @daemonmode)
!100 = !DIGlobalVariable(name: "pre_write_script", scope: !0, file: !98, line: 29, type: !9, isLocal: false, isDefinition: true, variable: i8** @pre_write_script)
!101 = !DIGlobalVariable(name: "post_write_script", scope: !0, file: !98, line: 30, type: !9, isLocal: false, isDefinition: true, variable: i8** @post_write_script)
!102 = !{i32 2, !"Dwarf Version", i32 2}
!103 = !{i32 2, !"Debug Info Version", i32 3}
!104 = !{i32 1, !"PIC Level", i32 2}
!105 = !{!"clang version 3.8.0 (tags/RELEASE_380/final)"}
!106 = !DILocalVariable(name: "path_to_file", arg: 1, scope: !6, file: !1, line: 17, type: !9)
!107 = !DIExpression()
!108 = !DILocation(line: 17, column: 33, scope: !6)
!109 = !DILocalVariable(name: "dir_name", scope: !6, file: !1, line: 19, type: !9)
!110 = !DILocation(line: 19, column: 11, scope: !6)
!111 = !DILocalVariable(name: "index", scope: !6, file: !1, line: 19, type: !9)
!112 = !DILocation(line: 19, column: 22, scope: !6)
!113 = !DILocation(line: 21, column: 11, scope: !114)
!114 = distinct !DILexicalBlock(scope: !6, file: !1, line: 21, column: 9)
!115 = !DILocation(line: 21, column: 9, scope: !6)
!116 = !DILocation(line: 21, column: 25, scope: !114)
!117 = !DILocation(line: 23, column: 23, scope: !6)
!118 = !DILocation(line: 23, column: 16, scope: !6)
!119 = !DILocation(line: 23, column: 14, scope: !6)
!120 = !DILocation(line: 24, column: 11, scope: !121)
!121 = distinct !DILexicalBlock(scope: !6, file: !1, line: 24, column: 9)
!122 = !DILocation(line: 24, column: 9, scope: !6)
!123 = !DILocation(line: 25, column: 8, scope: !121)
!124 = !DILocation(line: 27, column: 21, scope: !6)
!125 = !DILocation(line: 27, column: 13, scope: !6)
!126 = !DILocation(line: 27, column: 11, scope: !6)
!127 = !DILocation(line: 28, column: 9, scope: !128)
!128 = distinct !DILexicalBlock(scope: !6, file: !1, line: 28, column: 9)
!129 = !DILocation(line: 28, column: 9, scope: !6)
!130 = !DILocation(line: 30, column: 9, scope: !131)
!131 = distinct !DILexicalBlock(scope: !128, file: !1, line: 29, column: 5)
!132 = !DILocation(line: 30, column: 18, scope: !131)
!133 = !DILocation(line: 31, column: 15, scope: !131)
!134 = !DILocation(line: 31, column: 9, scope: !131)
!135 = !DILocation(line: 32, column: 5, scope: !131)
!136 = !DILocation(line: 33, column: 10, scope: !6)
!137 = !DILocation(line: 33, column: 5, scope: !6)
!138 = !DILocation(line: 34, column: 1, scope: !6)
!139 = !DILocalVariable(name: "filename", scope: !11, file: !1, line: 40, type: !9)
!140 = !DILocation(line: 40, column: 8, scope: !11)
!141 = !DILocation(line: 40, column: 26, scope: !11)
!142 = !DILocation(line: 40, column: 19, scope: !11)
!143 = !DILocation(line: 42, column: 15, scope: !144)
!144 = distinct !DILexicalBlock(scope: !11, file: !1, line: 42, column: 13)
!145 = !DILocation(line: 42, column: 13, scope: !11)
!146 = !DILocation(line: 43, column: 13, scope: !144)
!147 = !DILocation(line: 45, column: 19, scope: !148)
!148 = distinct !DILexicalBlock(scope: !11, file: !1, line: 45, column: 6)
!149 = !DILocation(line: 45, column: 8, scope: !148)
!150 = !DILocation(line: 45, column: 38, scope: !148)
!151 = !DILocation(line: 45, column: 43, scope: !148)
!152 = !DILocation(line: 45, column: 6, scope: !11)
!153 = !DILocation(line: 46, column: 3, scope: !148)
!154 = !DILocation(line: 49, column: 26, scope: !11)
!155 = !DILocation(line: 49, column: 5, scope: !11)
!156 = !DILocation(line: 52, column: 23, scope: !11)
!157 = !DILocation(line: 52, column: 17, scope: !11)
!158 = !DILocation(line: 52, column: 15, scope: !11)
!159 = !DILocation(line: 53, column: 9, scope: !160)
!160 = distinct !DILexicalBlock(scope: !11, file: !1, line: 53, column: 9)
!161 = !DILocation(line: 53, column: 9, scope: !11)
!162 = !DILocation(line: 54, column: 16, scope: !160)
!163 = !DILocation(line: 54, column: 9, scope: !160)
!164 = !DILocation(line: 56, column: 29, scope: !165)
!165 = distinct !DILexicalBlock(scope: !11, file: !1, line: 56, column: 9)
!166 = !DILocation(line: 56, column: 23, scope: !165)
!167 = !DILocation(line: 56, column: 21, scope: !165)
!168 = !DILocation(line: 56, column: 9, scope: !11)
!169 = !DILocation(line: 57, column: 52, scope: !170)
!170 = distinct !DILexicalBlock(scope: !165, file: !1, line: 56, column: 47)
!171 = !DILocation(line: 57, column: 9, scope: !170)
!172 = !DILocation(line: 59, column: 63, scope: !170)
!173 = !DILocation(line: 58, column: 9, scope: !170)
!174 = !DILocation(line: 60, column: 9, scope: !170)
!175 = !DILocation(line: 62, column: 12, scope: !11)
!176 = !DILocation(line: 62, column: 5, scope: !11)
!177 = !DILocation(line: 64, column: 10, scope: !11)
!178 = !DILocation(line: 64, column: 5, scope: !11)
!179 = !DILocation(line: 65, column: 1, scope: !11)
!180 = !DILocation(line: 69, column: 9, scope: !181)
!181 = distinct !DILexicalBlock(scope: !14, file: !1, line: 69, column: 9)
!182 = !DILocation(line: 69, column: 9, scope: !14)
!183 = !DILocation(line: 70, column: 13, scope: !184)
!184 = distinct !DILexicalBlock(scope: !185, file: !1, line: 70, column: 13)
!185 = distinct !DILexicalBlock(scope: !181, file: !1, line: 69, column: 20)
!186 = !DILocation(line: 70, column: 30, scope: !184)
!187 = !DILocation(line: 70, column: 13, scope: !185)
!188 = !DILocation(line: 71, column: 13, scope: !184)
!189 = !DILocation(line: 72, column: 16, scope: !185)
!190 = !DILocation(line: 72, column: 9, scope: !185)
!191 = !DILocation(line: 73, column: 19, scope: !185)
!192 = !DILocation(line: 74, column: 5, scope: !185)
!193 = !DILocation(line: 75, column: 1, scope: !14)
!194 = !DILocalVariable(name: "type", arg: 1, scope: !15, file: !1, line: 77, type: !10)
!195 = !DILocation(line: 77, column: 25, scope: !15)
!196 = !DILocalVariable(name: "ut", scope: !15, file: !1, line: 79, type: !197)
!197 = !DICompositeType(tag: DW_TAG_structure_type, name: "bftpdutmp", file: !198, line: 9, size: 2432, align: 64, elements: !199)
!198 = !DIFile(filename: "/Users/zhouyangjia/llvm-3.8.0.src/tools/clang/tools/clang-loggrad/test/bftpd/bftpdutmp.h", directory: "/Users/zhouyangjia/llvm-3.8.0.src/tools/clang/tools/clang-loggrad/test/bftpd")
!199 = !{!200, !201, !202, !206, !210}
!200 = !DIDerivedType(tag: DW_TAG_member, name: "bu_type", scope: !197, file: !198, line: 10, baseType: !10, size: 8, align: 8)
!201 = !DIDerivedType(tag: DW_TAG_member, name: "bu_pid", scope: !197, file: !198, line: 11, baseType: !21, size: 32, align: 32, offset: 32)
!202 = !DIDerivedType(tag: DW_TAG_member, name: "bu_name", scope: !197, file: !198, line: 12, baseType: !203, size: 248, align: 8, offset: 64)
!203 = !DICompositeType(tag: DW_TAG_array_type, baseType: !10, size: 248, align: 8, elements: !204)
!204 = !{!205}
!205 = !DISubrange(count: 31)
!206 = !DIDerivedType(tag: DW_TAG_member, name: "bu_host", scope: !197, file: !198, line: 13, baseType: !207, size: 2048, align: 8, offset: 312)
!207 = !DICompositeType(tag: DW_TAG_array_type, baseType: !10, size: 2048, align: 8, elements: !208)
!208 = !{!209}
!209 = !DISubrange(count: 256)
!210 = !DIDerivedType(tag: DW_TAG_member, name: "bu_time", scope: !197, file: !198, line: 14, baseType: !211, size: 64, align: 64, offset: 2368)
!211 = !DIDerivedType(tag: DW_TAG_typedef, name: "time_t", file: !212, line: 30, baseType: !213)
!212 = !DIFile(filename: "/usr/include/sys/_types/_time_t.h", directory: "/Users/zhouyangjia/llvm-3.8.0.src/tools/clang/tools/clang-loggrad/test/bftpd")
!213 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_time_t", file: !26, line: 120, baseType: !96)
!214 = !DILocation(line: 79, column: 22, scope: !15)
!215 = !DILocalVariable(name: "tmp", scope: !15, file: !1, line: 79, type: !197)
!216 = !DILocation(line: 79, column: 26, scope: !15)
!217 = !DILocalVariable(name: "i", scope: !15, file: !1, line: 80, type: !96)
!218 = !DILocation(line: 80, column: 10, scope: !15)
!219 = !DILocalVariable(name: "max_length", scope: !15, file: !1, line: 81, type: !27)
!220 = !DILocation(line: 81, column: 9, scope: !15)
!221 = !DILocation(line: 83, column: 10, scope: !222)
!222 = distinct !DILexicalBlock(scope: !15, file: !1, line: 83, column: 9)
!223 = !DILocation(line: 83, column: 9, scope: !15)
!224 = !DILocation(line: 84, column: 9, scope: !222)
!225 = !DILocation(line: 85, column: 5, scope: !15)
!226 = !DILocation(line: 86, column: 17, scope: !15)
!227 = !DILocation(line: 86, column: 8, scope: !15)
!228 = !DILocation(line: 86, column: 15, scope: !15)
!229 = !DILocation(line: 87, column: 9, scope: !230)
!230 = distinct !DILexicalBlock(scope: !15, file: !1, line: 87, column: 9)
!231 = !DILocation(line: 87, column: 9, scope: !15)
!232 = !DILocation(line: 88, column: 12, scope: !233)
!233 = distinct !DILexicalBlock(scope: !230, file: !1, line: 87, column: 15)
!234 = !DILocation(line: 88, column: 20, scope: !233)
!235 = !DILocation(line: 89, column: 9, scope: !233)
!236 = !DILocation(line: 90, column: 20, scope: !233)
!237 = !DILocation(line: 91, column: 9, scope: !233)
!238 = !DILocation(line: 92, column: 20, scope: !233)
!239 = !DILocation(line: 92, column: 31, scope: !233)
!240 = !DILocation(line: 92, column: 9, scope: !233)
!241 = !DILocation(line: 92, column: 12, scope: !233)
!242 = !DILocation(line: 92, column: 36, scope: !233)
!243 = !DILocation(line: 94, column: 16, scope: !233)
!244 = !DILocation(line: 94, column: 9, scope: !233)
!245 = !DILocation(line: 95, column: 11, scope: !233)
!246 = !DILocation(line: 96, column: 9, scope: !233)
!247 = !DILocation(line: 96, column: 22, scope: !233)
!248 = !DILocation(line: 96, column: 53, scope: !233)
!249 = !DILocation(line: 96, column: 16, scope: !233)
!250 = !DILocation(line: 97, column: 22, scope: !251)
!251 = distinct !DILexicalBlock(scope: !252, file: !1, line: 97, column: 17)
!252 = distinct !DILexicalBlock(scope: !233, file: !1, line: 96, column: 65)
!253 = !DILocation(line: 97, column: 18, scope: !251)
!254 = !DILocation(line: 97, column: 17, scope: !252)
!255 = !DILocation(line: 98, column: 17, scope: !251)
!256 = !DILocation(line: 99, column: 14, scope: !252)
!257 = !DILocation(line: 101, column: 28, scope: !233)
!258 = !DILocation(line: 101, column: 30, scope: !233)
!259 = !DILocation(line: 101, column: 26, scope: !233)
!260 = !DILocation(line: 102, column: 5, scope: !233)
!261 = !DILocation(line: 105, column: 12, scope: !230)
!262 = !DILocation(line: 105, column: 20, scope: !230)
!263 = !DILocation(line: 107, column: 15, scope: !15)
!264 = !DILocation(line: 107, column: 5, scope: !15)
!265 = !DILocation(line: 108, column: 11, scope: !15)
!266 = !DILocation(line: 108, column: 22, scope: !15)
!267 = !DILocation(line: 108, column: 5, scope: !15)
!268 = !DILocation(line: 109, column: 12, scope: !15)
!269 = !DILocation(line: 109, column: 41, scope: !15)
!270 = !DILocation(line: 109, column: 5, scope: !15)
!271 = !DILocation(line: 110, column: 12, scope: !15)
!272 = !DILocation(line: 110, column: 5, scope: !15)
!273 = !DILocation(line: 111, column: 1, scope: !15)
!274 = !DILocalVariable(name: "pid", arg: 1, scope: !18, file: !1, line: 113, type: !21)
!275 = !DILocation(line: 113, column: 32, scope: !18)
!276 = !DILocalVariable(name: "tmp", scope: !18, file: !1, line: 115, type: !197)
!277 = !DILocation(line: 115, column: 22, scope: !18)
!278 = !DILocation(line: 116, column: 7, scope: !279)
!279 = distinct !DILexicalBlock(scope: !18, file: !1, line: 116, column: 6)
!280 = !DILocation(line: 116, column: 6, scope: !18)
!281 = !DILocation(line: 117, column: 3, scope: !279)
!282 = !DILocation(line: 118, column: 12, scope: !18)
!283 = !DILocation(line: 118, column: 5, scope: !18)
!284 = !DILocation(line: 119, column: 5, scope: !18)
!285 = !DILocation(line: 119, column: 18, scope: !18)
!286 = !DILocation(line: 119, column: 49, scope: !18)
!287 = !DILocation(line: 119, column: 12, scope: !18)
!288 = !DILocation(line: 120, column: 18, scope: !289)
!289 = distinct !DILexicalBlock(scope: !290, file: !1, line: 120, column: 13)
!290 = distinct !DILexicalBlock(scope: !18, file: !1, line: 119, column: 61)
!291 = !DILocation(line: 120, column: 28, scope: !289)
!292 = !DILocation(line: 120, column: 25, scope: !289)
!293 = !DILocation(line: 120, column: 33, scope: !289)
!294 = !DILocation(line: 120, column: 41, scope: !289)
!295 = !DILocation(line: 120, column: 36, scope: !289)
!296 = !DILocation(line: 120, column: 13, scope: !290)
!297 = !DILocation(line: 121, column: 13, scope: !289)
!298 = !DILocation(line: 123, column: 5, scope: !18)
!299 = !DILocation(line: 124, column: 1, scope: !18)
!300 = !DILocalVariable(name: "username", arg: 1, scope: !28, file: !1, line: 126, type: !9)
!301 = !DILocation(line: 126, column: 31, scope: !28)
!302 = !DILocalVariable(name: "tmp", scope: !28, file: !1, line: 128, type: !197)
!303 = !DILocation(line: 128, column: 22, scope: !28)
!304 = !DILocalVariable(name: "count", scope: !28, file: !1, line: 129, type: !27)
!305 = !DILocation(line: 129, column: 6, scope: !28)
!306 = !DILocation(line: 130, column: 7, scope: !307)
!307 = distinct !DILexicalBlock(scope: !28, file: !1, line: 130, column: 6)
!308 = !DILocation(line: 130, column: 6, scope: !28)
!309 = !DILocation(line: 131, column: 3, scope: !307)
!310 = !DILocation(line: 132, column: 12, scope: !28)
!311 = !DILocation(line: 132, column: 5, scope: !28)
!312 = !DILocation(line: 133, column: 5, scope: !28)
!313 = !DILocation(line: 133, column: 19, scope: !28)
!314 = !DILocation(line: 133, column: 50, scope: !28)
!315 = !DILocation(line: 133, column: 13, scope: !28)
!316 = !DILocation(line: 138, column: 17, scope: !317)
!317 = distinct !DILexicalBlock(scope: !318, file: !1, line: 138, column: 13)
!318 = distinct !DILexicalBlock(scope: !28, file: !1, line: 133, column: 63)
!319 = !DILocation(line: 138, column: 13, scope: !317)
!320 = !DILocation(line: 138, column: 25, scope: !317)
!321 = !DILocation(line: 138, column: 42, scope: !317)
!322 = !DILocation(line: 138, column: 38, scope: !317)
!323 = !DILocation(line: 138, column: 51, scope: !317)
!324 = !DILocation(line: 138, column: 31, scope: !317)
!325 = !DILocation(line: 138, column: 61, scope: !317)
!326 = !DILocation(line: 138, column: 72, scope: !317)
!327 = !DILocation(line: 138, column: 65, scope: !317)
!328 = !DILocation(line: 138, column: 13, scope: !318)
!329 = !DILocation(line: 139, column: 9, scope: !317)
!330 = !DILocation(line: 139, column: 4, scope: !317)
!331 = !DILocation(line: 142, column: 9, scope: !332)
!332 = distinct !DILexicalBlock(scope: !28, file: !1, line: 142, column: 9)
!333 = !DILocation(line: 142, column: 15, scope: !332)
!334 = !DILocation(line: 142, column: 9, scope: !28)
!335 = !DILocation(line: 143, column: 14, scope: !332)
!336 = !DILocation(line: 143, column: 8, scope: !332)
!337 = !DILocation(line: 144, column: 12, scope: !28)
!338 = !DILocation(line: 144, column: 5, scope: !28)
!339 = !DILocation(line: 145, column: 1, scope: !28)
!340 = !DILocalVariable(name: "ip_address", arg: 1, scope: !31, file: !1, line: 147, type: !9)
!341 = !DILocation(line: 147, column: 34, scope: !31)
!342 = !DILocalVariable(name: "tmp", scope: !31, file: !1, line: 149, type: !197)
!343 = !DILocation(line: 149, column: 21, scope: !31)
!344 = !DILocalVariable(name: "count", scope: !31, file: !1, line: 150, type: !27)
!345 = !DILocation(line: 150, column: 8, scope: !31)
!346 = !DILocation(line: 152, column: 10, scope: !347)
!347 = distinct !DILexicalBlock(scope: !31, file: !1, line: 152, column: 8)
!348 = !DILocation(line: 152, column: 8, scope: !31)
!349 = !DILocation(line: 153, column: 7, scope: !347)
!350 = !DILocation(line: 155, column: 11, scope: !31)
!351 = !DILocation(line: 155, column: 4, scope: !31)
!352 = !DILocation(line: 156, column: 4, scope: !31)
!353 = !DILocation(line: 156, column: 19, scope: !31)
!354 = !DILocation(line: 156, column: 50, scope: !31)
!355 = !DILocation(line: 156, column: 12, scope: !31)
!356 = !DILocation(line: 158, column: 15, scope: !357)
!357 = distinct !DILexicalBlock(scope: !358, file: !1, line: 158, column: 11)
!358 = distinct !DILexicalBlock(scope: !31, file: !1, line: 157, column: 4)
!359 = !DILocation(line: 158, column: 11, scope: !357)
!360 = !DILocation(line: 158, column: 23, scope: !357)
!361 = !DILocation(line: 158, column: 40, scope: !357)
!362 = !DILocation(line: 158, column: 36, scope: !357)
!363 = !DILocation(line: 158, column: 49, scope: !357)
!364 = !DILocation(line: 158, column: 29, scope: !357)
!365 = !DILocation(line: 158, column: 11, scope: !358)
!366 = !DILocation(line: 159, column: 15, scope: !357)
!367 = !DILocation(line: 159, column: 10, scope: !357)
!368 = !DILocation(line: 162, column: 11, scope: !31)
!369 = !DILocation(line: 162, column: 4, scope: !31)
!370 = !DILocation(line: 163, column: 1, scope: !31)
!371 = !DILocalVariable(name: "pid", arg: 1, scope: !32, file: !1, line: 176, type: !27)
!372 = !DILocation(line: 176, column: 31, scope: !32)
!373 = !DILocalVariable(name: "current", scope: !32, file: !1, line: 178, type: !197)
!374 = !DILocation(line: 178, column: 22, scope: !32)
!375 = !DILocalVariable(name: "index", scope: !32, file: !1, line: 179, type: !27)
!376 = !DILocation(line: 179, column: 9, scope: !32)
!377 = !DILocation(line: 181, column: 11, scope: !378)
!378 = distinct !DILexicalBlock(scope: !32, file: !1, line: 181, column: 9)
!379 = !DILocation(line: 181, column: 9, scope: !32)
!380 = !DILocation(line: 182, column: 8, scope: !378)
!381 = !DILocation(line: 184, column: 12, scope: !32)
!382 = !DILocation(line: 184, column: 5, scope: !32)
!383 = !DILocation(line: 186, column: 5, scope: !32)
!384 = !DILocation(line: 186, column: 20, scope: !32)
!385 = !DILocation(line: 186, column: 59, scope: !32)
!386 = !DILocation(line: 186, column: 13, scope: !32)
!387 = !DILocation(line: 189, column: 21, scope: !388)
!388 = distinct !DILexicalBlock(scope: !389, file: !1, line: 189, column: 13)
!389 = distinct !DILexicalBlock(scope: !32, file: !1, line: 187, column: 5)
!390 = !DILocation(line: 189, column: 31, scope: !388)
!391 = !DILocation(line: 189, column: 28, scope: !388)
!392 = !DILocation(line: 189, column: 13, scope: !389)
!393 = !DILocation(line: 191, column: 18, scope: !394)
!394 = distinct !DILexicalBlock(scope: !388, file: !1, line: 190, column: 8)
!395 = !DILocation(line: 191, column: 29, scope: !394)
!396 = !DILocation(line: 191, column: 35, scope: !394)
!397 = !DILocation(line: 191, column: 12, scope: !394)
!398 = !DILocation(line: 192, column: 12, scope: !394)
!399 = !DILocation(line: 193, column: 20, scope: !394)
!400 = !DILocation(line: 193, column: 59, scope: !394)
!401 = !DILocation(line: 193, column: 12, scope: !394)
!402 = !DILocation(line: 194, column: 8, scope: !394)
!403 = !DILocation(line: 195, column: 13, scope: !389)
!404 = !DILocation(line: 197, column: 1, scope: !32)
