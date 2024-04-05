// License: Mozilla Public License : Version 2.0
// Author : John Lonergan
/* 
Verilog simulation of https://github.com/Johnlon/NESInterfaceAndPeripherals
*/
`ifndef V_GAMEPAD
`define V_GAMEPAD

`define EOF 32'hFFFF_FFFF 
`define NULL 0 
`define NL 10
`define CR 13

`include "../lib/assertion.v"

`timescale 1ns/1ns

module gamepadAdapter #(parameter CONTROL_FILE="gamepad.control") (
    input  _OErandom, 
    input  _OEpad1, 
    input  _OEpad2, 
    output [7:0] Q
);

    function string strip;
        input string str;
    begin
        if (str.len() > 0) begin
            while (str[str.len()-1] == `NL || str[str.len()-1] == `CR) begin
                str = str.substr(0, str.len()-2); 
            end
        end
        strip = str;
    end
    endfunction


    int fControl;
    int c, r;
    int tDelta;
    string strInput = "";
    string controlFile;
    reg [1024:0] errStr;
    integer errno;
    integer iController;
    integer iControllerValue;
    reg [7:0] iController1Value;
    reg [7:0] iController2Value;
    reg [7:0] iRandomValue;
    reg randomValueSet=1'b0;
    localparam MAX_LINE_LENGTH=4096;
    reg [8*MAX_LINE_LENGTH:0] line; /* Line of text read from file */ 


    initial 
    begin : file_block 
        // tiny delay allows the main program to setup the control file
        #1

        if (! $value$plusargs("gamepad_control_file=%s", controlFile)) begin
            controlFile = CONTROL_FILE;
        end

        $display("%9t GAMEPAD ", $time, " opening file %s", controlFile);
        `ifndef verilator
                fControl = $fopenr(controlFile); 
        `endif

        if (fControl == `NULL) // If error opening file 
        begin
                $error("%9t ERROR ", $time, " failed opening file %s", controlFile);
                `FINISH_AND_RETURN(1);
                disable file_block; // Just quit 
        end
        $display("%9t GAMEPAD ", $time, " file open");

        while (fControl != `NULL)  
        begin

            c = $fgetc(fControl); 

            #10 // needed so that main loop gets a look in

            if (c != `EOF) 
            begin 
                if (c == "/") // comment - echo to console
                begin 
                    line="";
                    r = $fgets(line, fControl); 
                    if (r == 0) begin
                        errno = $ferror(fControl, errStr);
                        $display("%9t ", $time, "GAMECONTROLLER: CANT READ LINE: $s", errStr);
                    end
                    $display("%9t ", $time, "GAMECONTROLLER: LINE: // %-s", line);
                
                    strInput = strip(line);
                    $display("%9t ", $time, "GAMECONTROLLER: CONTROL RX: // %-s", strInput);
                end
                else if (c == "c") // identify controller  eg    c1=23
                begin 
                    line="";
                    r = $fgets(line, fControl); 
                    if (r == 0) begin
                        errno = $ferror(fControl, errStr);
                        $display("%9t ", $time, "GAMECONTROLLER: CANT READ LINE: $s", errStr);
                    end
                    strInput = strip(line);

                    r = $sscanf(strInput, "%1d=%02x", iController, iControllerValue);
                    if (r == 0) begin
                        $display("%9t ", $time, "GAMECONTROLLER: CONTROL RX: '%s' can't convert", strInput);
                    end

                    if (iController==1) begin
                        iController1Value = iControllerValue;
                        $display("%9t ", $time, "GAMECONTROLLER: CONTROL RX: 'c%s' :  controller 1 = %8b", strInput, iController1Value);
                    end
                    else if (iController==2) begin
                        iController2Value = iControllerValue;
                        $display("%9t ", $time, "GAMECONTROLLER: CONTROL RX: 'c%s' :  controller 2 = %8b", strInput, iController2Value);
                    end
                    else $display("%9t ", $time, "GAMECONTROLLER: CONTROL RX: 'c%s' :  %d is not a controller id", strInput, iController);


                end

                else if (c == "r") // identify random number setting
                begin 

                    line="";
                    r = $fgets(line, fControl); 
                    if (r == 0) begin
                        errno = $ferror(fControl, errStr);
                        $display("%9t ", $time, "GAMECONTROLLER: CANT READ LINE: $s", errStr);
                    end
                    strInput = strip(line);

                    r = $sscanf(strInput, "=%02x", iRandomValue);
                    if (r == 0) begin
                        $display("%9t ", $time, "GAMECONTROLLER: CONTROL RX: '%s' can't convert", strInput);
                    end

                    randomValueSet = 1;
                end
                else if (c == "#") // sleep N ns
                begin
                    tDelta=0;
                    line="";
                    r = $fgets(line, fControl);  // consumes the line ending and space chars 
                    if (r == 0) begin
                        errno = $ferror(fControl, errStr);
                        $display("%9t ", $time, "GAMECONTROLLER: CANT READ LINE: $s", errStr);
                    end
                    strInput = strip(line);

                    r = $sscanf(line,"%d\n", tDelta); 
                    #tDelta 
                    $display("%9t ", $time, "GAMECONTROLLER: CONTROL RX: '#%s' :  slept for %d", strInput, tDelta);
                    
                end
            end
            else
            begin
              // otherwise chews the CPU and verilog runs like a pig
              #1000000
              $display("%9t ", $time, "GAMECONTROLLER: NO INPUT - slept");
            end
        end
    end

    assign Q = _OEpad1 ? (_OEpad2 ? (_OErandom ? 8'bz: (randomValueSet ? iRandomValue: $random)): iController2Value) : iController1Value;
    //assign Q = _OEpad1 ? (_OEpad2 ? (_OErandom ? 8'bz: $random): iController2Value) : iController1Value;

endmodule

`endif

