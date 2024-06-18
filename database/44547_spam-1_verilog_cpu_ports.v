// This program was cloned from: https://github.com/Johnlon/spam-1
// License: Mozilla Public License 2.0

// License: Mozilla Public License : Version 2.0
// Author : John Lonergan

`ifndef V_PORTS
`define V_PORTS

`timescale 1ns/1ns

package ports;
 
    localparam  PORT_RD_RANDOM = 0;
    localparam  PORT_RD_GAMEPAD1 = 1;
    localparam  PORT_RD_GAMEPAD2 = 2;
    localparam  PORT_RD_TIMER1 = 3;
    localparam  PORT_RD_TIMER2 = 4;
    localparam  PORT_RD_PARALLEL = 7;

    localparam  PORT_WR_TIMER1 = 3;
    localparam  PORT_WR_TIMER2 = 4;
    localparam  PORT_WR_PARALLEL = 7;

    typedef reg[8*8:1] PortName;

    function PortName portNameRD; input [3:0] portno;
        PortName tmp;
        begin
            case(portno)
                 0 : portNameRD =    "RANDOM";
                 1 : portNameRD =    "GAMEPAD1";
                 2 : portNameRD =    "GAMEPAD2";
                 3 : portNameRD =    "TIMER1";
                 4 : portNameRD =    "TIMER2";
                 7 : portNameRD =    "PARALLEL";

                default: begin
                    $sformat(tmp,"??(%d)",portno);
                    portNameRD = tmp;
                end
            endcase
        end
    endfunction
    
    function PortName portNameWR; input [3:0] portno;
        PortName tmp;
        begin
            case(portno)
                 3 : portNameWR =    "TIMER1";
                 4 : portNameWR =    "TIMER2";
                 7 : portNameWR =    "PARALLEL";

                default: begin
                    $sformat(tmp,"??(%d)",portno);
                    portNameWR = tmp;
                end
            endcase
        end
    endfunction
    

endpackage

`endif
