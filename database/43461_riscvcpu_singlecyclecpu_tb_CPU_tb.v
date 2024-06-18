// This program was cloned from: https://github.com/immortalrover/riscvcpu
// License: MIT License

`timescale 1ns/1ns

module CPU_tb();
reg					clk;
reg					reset;
wire[31:0]	pc;
    
CPU cpu(clk, reset, pc);

integer counter = 0;

initial begin
	$dumpfile("build/test.vcd");
	$dumpvars;
  $readmemh("tb/riscv32_sim8.dat", cpu.instrMem.RAM);
  /* $readmemh("tb/riscv32_sim2.dat", cpu.ID.mem.RAM); */
  clk = 1;
	reset = 0;
end

always begin
   #300 clk = ~clk;
  
   if (clk == 1'b1) 
   begin
      counter = counter + 1;
      //comment out all display line(s) for online judge
      if (pc > 32'h00000500) // set to the address of the last instruction
       begin

         $stop;
       end
   end  
end //end always

endmodule
