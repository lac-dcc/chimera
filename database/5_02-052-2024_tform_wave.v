// This program was cloned from: https://github.com/Lena-2023/02-052-2024
// License: MIT License

module tform_wave;

reg CLK;
reg RESET;

reg [7:0] NOTE; 
wire [31:0] ADDER;
wire [31:0] DDS;
reg [6:0] pulse_width;



reg [2:0] form_saw;
reg [2:0] form_revsaw;
reg [2:0] form_trian;
reg [2:0] form_mean;
reg [2:0] form_mean025;


wire [31:0] DDSout_saw;
wire [31:0] DDSout_revsaw;
wire [31:0] DDSout_trian;
wire [31:0] DDSout_mean;
wire [31:0] DDSout_mean025;

initial NOTE = 8'd00000069;

initial form_saw = 3'b000;
initial form_revsaw = 3'b001;
initial form_trian = 3'b010;
initial form_mean = 3'b011;
initial form_mean025 = 3'b100;

initial pulse_width = 7'b0101000;


note2dds_1st_gen n2d(CLK, NOTE, ADDER);
DDS dds2(CLK, RESET, ADDER, DDS);

form_wave form_wave_saw(CLK, RESET, DDS, DDSout_saw, form_saw, pulse_width);
form_wave form_wave_revsaw(CLK, RESET, DDS, DDSout_revsaw, form_revsaw, pulse_width);
form_wave form_wave_trian(CLK, RESET, DDS, DDSout_trian, form_trian, pulse_width);
form_wave form_wave_mean(CLK, RESET, DDS, DDSout_mean, form_mean, pulse_width);
form_wave form_wave_mean025(CLK, RESET, DDS, DDSout_mean025, form_mean025, pulse_width);

initial
begin
    
    
    $dumpfile("bench.vcd");
    $dumpvars(0,tform_wave);    
    $display("starting testbench!!!!");
    
    //$display("RESET CLK  NOTE ADDER  DDS DDSout form");

    //$monitor(RESET,, CLK,, NOTE,, ADDER,,  DDS,, DDSout,, form);


    $display("form_saw,, form_revsaw,, form_trian,, form_mean,,  form_mean025");
    
    $monitor(form_saw,, form_revsaw,, form_trian,, form_mean,,  form_mean025);
  
    $monitor(DDSout_saw,, DDSout_revsaw,, DDSout_trian,, DDSout_mean,,  DDSout_mean025);
  
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