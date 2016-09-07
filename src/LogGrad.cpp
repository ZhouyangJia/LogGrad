//
//  LogGrad.cpp
//  LLVM
//
//  Created by ZhouyangJia on 16/4/13.
//
//

#include "LogGrad.h"
#include "FindLoggedSnippet.h"


// Shared variables
// count files
string lastName;
int fileNum;
int fileTotalNum;

FILE* fFuncRuleModel;

// Function rule mining
map<string, int> myLoggedTime;
map<string, int> myCalledTime;


static cl::extrahelp CommonHelp(CommonOptionsParser::HelpMessage);

static cl::extrahelp MoreHelp(
	"\tFor example, to run clang-smartlog on all files in a subtree of the\n"
	"\tsource tree, use:\n"
	"\n"
	"\t  find path/in/subtree -name '*.cpp'|xargs clang-loggrad\n"
	"\n"
	"\tor using a specific build path:\n"
	"\n"
	"\t  find path/in/subtree -name '*.cpp'|xargs clang-loggrad -p build/path\n"
	"\n"
	"\tNote, that path/in/subtree and current directory should follow the\n"
	"\trules described above.\n"
	"\n"
);

static cl::OptionCategory ClangMytoolCategory("clang-loggrad options");

static std::unique_ptr<opt::OptTable> Options(createDriverOptTable());


static cl::opt<bool> FindLoggedSnippet("log-grade",
                                       cl::desc("Calculate log grad."),
                                       cl::cat(ClangMytoolCategory));


int main(int argc, const char **argv) {
	
	CommonOptionsParser OptionsParser(argc, argv, ClangMytoolCategory);
	vector<string> source = OptionsParser.getSourcePathList();
    fileTotalNum = source.size();
    
    std::unique_ptr<FrontendActionFactory> FrontendFactory;
 
    if(FindLoggedSnippet){
        
        bool diag = true;
        fileNum = 0;
        lastName = "";
        myLoggedTime.clear();
        myCalledTime.clear();
        
        FrontendFactory = newFrontendActionFactory<FindLoggedAction>();
        
        fFuncRuleModel = fopen("function_rule_model.out","w");
        for(unsigned i = 0; i < source.size(); i++){
            vector<string> mysource;
            mysource.push_back(source[i]);
            ClangTool Tool(OptionsParser.getCompilations(), mysource);
            Tool.clearArgumentsAdjusters();
            if(diag){IgnoringDiagConsumer* idc = new IgnoringDiagConsumer();
                Tool.setDiagnosticConsumer(idc);}
            Tool.run(FrontendFactory.get());
        }
        
        map<string,int>::iterator it;
        for(it = myCalledTime.begin(); it != myCalledTime.end(); ++it){
            
            string name = it->first;
            if(name == "")
                continue;
            int call = it->second;
            int log = myLoggedTime[name];
            char arg[100];
            sprintf(arg, "%s,%d,%d\n", name.c_str(), call, log);
            fputs(arg,fFuncRuleModel);
            
        }
        
        fclose(fFuncRuleModel);
    }
    
	return 0;
}
