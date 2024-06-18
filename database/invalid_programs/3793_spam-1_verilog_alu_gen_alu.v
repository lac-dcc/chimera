// This program was cloned from: https://github.com/Johnlon/spam-1
// License: Mozilla Public License 2.0

// License: Mozilla Public License : Version 2.0
// Author : John Lonergan
`ifndef  V_GEN_ALU
`define  V_GEN_ALU
/* 
    Run this with icarus verilog using "../simulate.sh gen_alu.v"

    Generates a sequence of binary rom files for burning to a M27C322 EPROM using a TL866 burner.
    The names of the files match the names of the operations and may have spcaes in them - which I can't easily remove in verilog
    This is based on https://github.com/DoctorWkt/CSCvon8/blob/master/gen_alu but is driven by callign my actual verilog ALU impl rather than using a separate set of logic.

    Also creates a file alu-hex.rom that can be loaded into a verilog rom simulator.
*/

`include "./alu.v"

// verilator lint_off ASSIGNDLY
// verilator lint_off STMTDLY
// verilator lint_off MULTITOP

`timescale 1ns/1ns

module gen_alu();
    import alu_ops::*;

	integer a, b, alu_op;

    wire [7:0] o;
    wire _flag_c;
    wire _flag_n;
    wire _flag_z;
    wire _flag_o;
    wire _flag_gt;
    wire _flag_lt;
    wire _flag_eq;
    wire _flag_ne;
	
    OpName op_name;

	alu_code #(.LOG(0)) Alu( .o, .a(8'(a)), .b(8'(b)), .alu_op(5'(alu_op)), ._flag_c, ._flag_z, ._flag_n, ._flag_o, ._flag_eq, ._flag_ne, ._flag_gt, ._flag_lt);

    integer counter=0;
    int block, sub_block;
    int n_file;
    int hex_file;
    string block_file;

    initial begin
        hex_file = $fopen("roms/alu-hex.rom", "wb");
/*
        a = 0;
        b = 0;
        alu_op = 0;
*/

        #(10*Alu.PD)
        $display("settle");

        for (block=0; block < 8; block++) begin

            block_file = $sformatf("roms/alu%-1d.rom", block);

            n_file = $fopen(block_file, "wb");

            for (sub_block=0; sub_block < 4; sub_block++) begin
                alu_op = {3'(block), 2'(sub_block)};
                op_name = aluopNameR(alu_op);

                for (a=0; a <= 255 ; a++) begin
                    for (b=0; b <= 255 ; b++) begin
                        // long enough for any settling
                        #(10*Alu.PD)

                        // little endian 
                        $fwrite(n_file, "%c", o[7:0]);
                        $fwrite(n_file, "%c", { _flag_c, _flag_z, _flag_n, _flag_o, _flag_eq, _flag_ne, _flag_gt, _flag_lt });

                        // hex
                        $fwrite(hex_file, "%04x ", { _flag_c, _flag_z, _flag_n, _flag_o, _flag_eq, _flag_ne, _flag_gt, _flag_lt, o });

                        if (0)
                        $display ("%9t", $time, " (%5d) ALU: a=%8b(d%4d/h%02h) b=%8b(d%4d/h%02h)  op=%02d %10s  result=%8b(%4d/%02h)   _flags (_c=%b _z=%1b _n=%1b _o=%1b _eq=%1b _ne=%1b _gt=%1b _lt=%b)", 
                            counter, 8'(a), 8'(a), 8'(a), 8'(b), 8'(b), 8'(b), alu_op,
                            op_name, o, o, o, _flag_c, _flag_z, _flag_n, _flag_o, _flag_eq, _flag_ne, _flag_gt, _flag_lt
                        );

                        counter++;
                        if (counter % 8 == 0) begin
                            $fwrite(hex_file, "\n");
                        end

                        if (counter % (256*256) == 0 ) $display("DONE %s", op_name);
                    end    
                end    
            end    
            $fclose(n_file);
            $display("DONE file %s", block_file);
        end    
        $fclose(hex_file);
    end

endmodule
`endif
