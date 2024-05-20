// This program was cloned from: https://github.com/Aurora2580/verilog
// License: MIT License

module TestBench;
    reg clk = 0, init;
    always #50 clk = ~clk;
    wire [31:0] DataBusInA, DataBusInB,DataBusOut,AddressBusA, AddressBusB;
    wire [3:0] ContralBus;
    //module CPU(clk, DataBusInA, DataBusInB,DataBusOut,AddressBusA, AddressBusB, ContralBus, init);
    CPU cpu(.clk(clk),.DataBusInA(DataBusInA),.DataBusInB(DataBusInB),.DataBusOut(DataBusOut),.AddressBusA(AddressBusA),.AddressBusB(AddressBusB),.ContralBus(ContralBus), .init(init));


    //module Memory(ra, rb, wa, we, wd, qa, qb, Memhalf, Membyte, MemExt, clk);
    //ContralBus = {MemWrite,Memrhalf, Memrbyte,MemExt};
    Memory memory(.ra(AddressBusA), .rb(AddressBusB), .wa(AddressBusB), .we(ContralBus[3]), .wd(DataBusOut), .qa(DataBusInA), .qb(DataBusInB), .Memhalf(ContralBus[2]), .Membyte(ContralBus[1]), .MemExt(ContralBus[0]), .clk(clk));
    
    initial begin
        init = 1;
        #1
        init = 0;
    end

endmodule



