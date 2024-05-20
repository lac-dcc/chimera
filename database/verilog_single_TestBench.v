// This program was cloned from: https://github.com/Aurora2580/verilog
// License: MIT License

module TestBench;
    reg clk = 0, init;
    always #5 clk = ~clk;
    wire [31:0] DataBusIn, DataBusOut;
    wire [31:0] AddressBus;
    wire [3:0] ContralBus;
    //module CPU(clk_, DataBusIn, DataBusOut,AddressBus, ContralBus, init);
    CPU cpu(.clk_(clk),.DataBusIn(DataBusIn),.DataBusOut(DataBusOut),.AddressBus(AddressBus),.ContralBus(ContralBus), .init(init));


    //module Memory(ra, wa, we, wd, rd, Memhalf, Membyte, MemExt, clk);
    //ContralBus = {MemWrite,Memrhalf, Memrbyte,MemExt};
    Memory memory(.ra(AddressBus), .wa(AddressBus), .we(ContralBus[3]), .wd(DataBusOut), .rd(DataBusIn), .Memhalf(ContralBus[2]), .Membyte(ContralBus[1]), .MemExt(ContralBus[0]), .clk(clk));
    
    initial begin
        init = 1;
        #1
        init = 0;
    end

endmodule


