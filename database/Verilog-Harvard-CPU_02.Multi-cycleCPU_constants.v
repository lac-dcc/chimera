// This program was cloned from: https://github.com/jaywonchung/Verilog-Harvard-CPU
// License: MIT License

`define PERIOD1 100
`define READ_DELAY 30 // delay before memory data is ready
`define WRITE_DELAY 30 // delay in writing to memory
`define MEMORY_SIZE 256 // size of memory is 2^8 words (reduced size)
`define WORD_SIZE 16 // instead of 2^16 words to reduce memory
                        
`define NUM_TEST 56
`define TESTID_SIZE 5