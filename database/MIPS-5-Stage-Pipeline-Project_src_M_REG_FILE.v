// This program was cloned from: https://github.com/the-pinbo/MIPS-5-Stage-Pipeline-Project
// License: MIT License

module M_REG_FILE(
    input clk,
    input reg_write,
    input[4:0]  read_reg1, read_reg2, write_reg,
    input[31:0] write_data,
    output[31:0] read_data1, read_data2,
    output[6:0] segment0,
    output[6:0] segment1,
    output[6:0] segment2,
    output[6:0] segment3,
    output[6:0] segment4,
    output[6:0] segment5
    );

    reg [31:0] rf[31:0];
    reg[3:0] hex_num_0, hex_num_1, hex_num_2, hex_num_3, hex_num_4, hex_num_5;


    // double pumped register file (read followed by write)
    always@(negedge clk)
    begin
        if (reg_write) begin
            rf[write_reg] <= write_data;
            
            if(write_reg == 5'b10001)begin
                $display("----------------------------------------------------------");
                $display("Data is being written to S1 %h",write_data);
                $display("HEX number 0 %h",hex_num_0);
                $display("HEX number 1 %h",hex_num_1);
                $display("HEX number 2 %h",hex_num_2);
                $display("HEX number 3 %h",hex_num_3);
                $display("HEX number 4 %h",hex_num_4);
                $display("HEX number 5 %h",hex_num_5);
                $display("----------------------------------------------------------");
                hex_num_0 <= write_data[3:0];
                hex_num_1 <= write_data[7:4];
                hex_num_2 <= write_data[11:8];
                hex_num_3 <= write_data[15:12];
                hex_num_4 <= write_data[19:16];
                hex_num_5 <= write_data[23:20];
            end

            case(write_reg)
                5'b10000: $display("content of $s0 = %h", write_data);
                5'b10001: $display("content of $s1 = %h", write_data);
                5'b10010: $display("content of $s2 = %h", write_data);
                5'b10011: $display("content of $s3 = %h", write_data);
                5'b10100: $display("content of $s4 = %h", write_data);
                5'b01000: $display("content of $t0 = %h", write_data);
                5'b01001: $display("content of $t1 = %h", write_data);
                5'b01010: $display("content of $t2 = %h", write_data);
                default:  $display("no data written to register file");
            endcase
        end
    end

    // zero register
    assign read_data1 = (read_reg1 != 0) ? rf[read_reg1] : 0;
    assign read_data2 = (read_reg2 != 0) ? rf[read_reg2] : 0;

    M_7SEG_DECODER display_0(hex_num_0, segment0);
    M_7SEG_DECODER display_1(hex_num_1, segment1);
    M_7SEG_DECODER display_2(hex_num_2, segment2);
    M_7SEG_DECODER display_3(hex_num_3, segment3);
    M_7SEG_DECODER display_4(hex_num_4, segment4);
    M_7SEG_DECODER display_5(hex_num_5, segment5);

endmodule