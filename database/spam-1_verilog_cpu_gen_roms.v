// License: Mozilla Public License : Version 2.0
// Author : John Lonergan
`ifndef  V_GEN_ROM
`define  V_GEN_ROM
/* 
    Generates a file that counts 0-255 across entire address space
*/

// verilator lint_off ASSIGNDLY
// verilator lint_off STMTDLY
// verilator lint_off MULTITOP

`timescale 1ns/1ns

module gen_alu();

    logic [7:0] data =0;
    int n_file;
    int addr;
    string file_name = "roms/test-rom.rom";

    initial begin

        n_file = $fopen(file_name, "wb");

        for (addr=0; addr < 65536; addr++) begin
            // little endian 
            data = addr % 256;
            $fwrite(n_file, "%c", data);

        end    
        $fclose(n_file);
        $display("DONE file %s", file_name);
    end

endmodule
`endif
