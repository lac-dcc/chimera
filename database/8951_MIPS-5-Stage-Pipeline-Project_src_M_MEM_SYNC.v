// This program was cloned from: https://github.com/the-pinbo/MIPS-5-Stage-Pipeline-Project
// License: MIT License

module M_MEM_SYNC#(
    parameter RAM_SIZE = 256
)(
    input clk,
    input mem_write,
    input[31:0] address,
    input[31:0] write_data,
    output[31:0] read_data);

    reg[31:0] RAM[RAM_SIZE-1:0];

    assign read_data = RAM[address[31:2]]; // word aligned

    initial $readmemh("memdata.dat", RAM);  

    always @(posedge clk) begin
        if (mem_write) begin
            RAM[address[31:2]] <= write_data;
            $display("address %h now has data %h", address[31:0], write_data);
        end
    end
endmodule