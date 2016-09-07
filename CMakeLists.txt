set( LLVM_LINK_COMPONENTS
  ${LLVM_TARGETS_TO_BUILD}
  Option
  Support
  )

add_clang_executable(clang-loggrad
  src/LogGrad.cpp
  src/FindLoggedSnippet.cpp
  )

target_link_libraries(clang-loggrad
  clangAST
  clangBasic
  clangDriver
  clangFrontend
  clangRewriteFrontend
  clangStaticAnalyzerFrontend
  clangTooling
  )

install(TARGETS clang-loggrad
  RUNTIME DESTINATION bin)
