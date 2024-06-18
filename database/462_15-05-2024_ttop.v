// This program was cloned from: https://github.com/Lena-2023/15-05-2024
// License: MIT License

module ttop;

reg CLK;
reg RESET;

reg [7:0] NOTE; 
wire [31:0] ADDER;
wire [31:0] DDS;
reg [6:0] pulse_width;
reg [2:0] form;
wire [31:0] DDSout;

initial NOTE = 8'd00000069;
initial form = 3'b010;  //trian
initial pulse_width = 7'b0101000;


top TOP(CLK, NOTE, RESET, form, pulse_width, DDSout);

initial
begin
    
    
    $dumpfile("bench.vcd");
    $dumpvars(0,ttop);    
    $display("starting testbench!!!!");
    
    
    $display("RESET,, CLK,, NOTE,, ADDER,,  DDS,, DDSout,, form");
    
    $monitor(RESET,, CLK,, NOTE,, ADDER,,  DDS,, DDSout,, form);
  
     
        CLK <= 0; 
        repeat (500000)  //500000
            
        begin
                #10;
                CLK <= 1;
                #10;
                CLK <= 0; 
        end
           

    $display("finished OK!");
    
end

initial
begin
  RESET <= 1;
  #100;
  RESET <= 0;
end

endmodule