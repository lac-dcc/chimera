// This program was cloned from: https://github.com/Harminder13/RISC-Computer-Design
// License: MIT License

module Ram(
    input Clk, 
    input ReadSignal,
    input WriteSignal,
    input [31:0] DataIn,
    input [8:0] AddressIn,
    output reg [31:0] DataOut
);

reg [31:0] RamBlock [0:511];

always @(posedge Clk) begin
    if (WriteSignal==1)
        RamBlock[AddressIn] <= DataIn;
    else if (ReadSignal==1)
        DataOut <= RamBlock[AddressIn];
end

endmodule
