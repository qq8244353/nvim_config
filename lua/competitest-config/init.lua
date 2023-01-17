require('competitest').setup {
    testcases_input_file_format = "sample-$(TCNUM).in",
    testcases_output_file_format = "sample-$(TCNUM).out",
    testcases_directory = "test",
    runner_ui = {interface = "split"},
    split_ui = {position = "bottom"},
    compile_command = {
        cpp = {
            exec = 'g++',
            args = {
                '-std=c++17', '-I', '/Users/preds1dent/.kyoproInclude',
                '$(FNAME)', '-o', 'a.out'
            }
        },
        some_lang = {exec = 'some_compiler', args = {'$(FNAME)'}}
    },
    run_command = {
        cpp = {exec = './a.out'},
        some_lang = {exec = 'some_interpreter', args = {'$(FNAME)'}}
    }
}
