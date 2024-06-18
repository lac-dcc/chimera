// This program was cloned from: https://github.com/the-pinbo/MIPS-5-Stage-Pipeline-Project
// License: MIT License

// `include "M_7SEG_DECODER.v"

module M_DISPLAY_RESULTS_S1(
    input clk,
    input[4:0] write_reg,
    input[31:0] write_data,
    output[6:0] segment0,
    output[6:0] segment1,
    output[6:0] segment2,
    output[6:0] segment3,
    output[6:0] segment4,
    output[6:0] segment5
);
    reg[3:0] hex_num_0, hex_num_1, hex_num_2, hex_num_3, hex_num_4, hex_num_5;
    
    always@(negedge clk)begin
        if(write_reg == 5'b10001)begin
            $display("----------------------------------------------------------");
            $display("Data is being written to S1 %d",write_data);
            $display("----------------------------------------------------------");
            hex_num_0 <= write_data[3:0];
            hex_num_1 <= write_data[7:4];
            hex_num_2 <= write_data[11:8];
            hex_num_3 <= write_data[15:12];
            hex_num_4 <= write_data[19:16];
            hex_num_5 <= write_data[23:20];
        end
    end
    
    M_7SEG_DECODER display_0(hex_num_0, segment0);
    M_7SEG_DECODER display_1(hex_num_1, segment1);
    M_7SEG_DECODER display_2(hex_num_2, segment2);
    M_7SEG_DECODER display_3(hex_num_3, segment3);
    M_7SEG_DECODER display_4(hex_num_4, segment4);
    M_7SEG_DECODER display_5(hex_num_5, segment5);
endmodule