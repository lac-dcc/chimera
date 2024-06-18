// This program was cloned from: https://github.com/Mahmoud-Abdelraouf/Computer-Organization-and-Architecture
// License: MIT License

module PIC_TopModule_tb;

// Inputs
reg INTA;
reg RD;
reg WR; 
reg A0; 
reg CS; 
wire [2:0] CAS; 
reg SP;
reg [7:0] IR0_to_IR7;

// Outputs
wire INT;
wire [7:0] sys_DataLine;
reg [7:0] sys;


PIC_TopModule topModuleInstance(
    .INTA(INTA),
    .INT(INT),
    .sys_DataLine(sys_DataLine),
    .RD(RD),
    .WR(WR),
    .A0(A0),
    .CS(CS),
    .CAS(CAS),
    .SP(SP),
    .IR0_to_IR7(IR0_to_IR7)
);

assign sys_DataLine = sys;

initial begin
    // initialize inputs
    INTA = 1; 
    RD = 1;
    WR = 1;
    A0 = 0;
    CS = 0;
    SP = 1;
    IR0_to_IR7 = 8'b00000000;
    sys = 8'b00000000;
    #10

    // Apply Stimulus
    
  // Single Mode -NO ICW4- Edge Triggered
    // ICW1 
    sys = 8'b00110110;
    #10 RD = 1;
    WR = 0;
    A0 = 0;
    SP = 1;
    IR0_to_IR7 = 8'b00000000;
    #10

    // end ICW1
    WR = 1;
    #10

    // ICW2
    RD = 1;
    WR = 0;
    A0 = 1;
    SP = 1;
    IR0_to_IR7 = 8'b00000000;
    sys = 8'b11111111;
    #10

    // end ICW2
    WR = 1;
    #10

    // Receive first interrupt IR3
    RD = 1;
    WR = 1;
    A0 = 0;
    SP = 1;
    IR0_to_IR7 = 8'b00001000;
    sys = 8'bzzzzzzzz;
    #10
    //1st pulse
    INTA = 0;
    #1
    INTA = 1;
    #10
    //end 1st pulse
    
    //2nd pulse
    
    INTA = 0;
    #1 RD = 0;
    #1 INTA = 1;
    //end 1st pulse
    #10
    RD = 1;

    
    


    $stop; // End Simulation
end

endmodule //PIC_TopModule_tb
