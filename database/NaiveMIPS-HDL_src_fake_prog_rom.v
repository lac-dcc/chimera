module prog_rom(/*autoport*/
//output
            data,
//input
            address);

input wire [31:0] address;
output wire [31:0] data;

reg[31:0] rom[0:2047];

initial begin
    // rom[0] <= 32'h3401aa00;
    // rom[1] <= 32'h340255aa;
    // rom[2] <= 32'h3403ffff;
    // rom[3] <= 32'h34041234;
    // rom[4] <= 32'h20450123; // addi $5, $2, 0x123
    // rom[5] <= 32'h00000000;
    // $readmemh("test_rom.txt",rom);
end

// assign data = {rom[address+32'd3],
//                 rom[address+32'd2],
//                 rom[address+32'd1],
//                 rom[address]};

assign data = rom[address[31:2]];


endmodule
