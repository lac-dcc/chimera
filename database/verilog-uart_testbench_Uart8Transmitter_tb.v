// This program was cloned from: https://github.com/hell03end/verilog-uart
// License: MIT License

`timescale 1 ns / 100 ps

`ifndef SIMULATION_CYCLES
    `define SIMULATION_CYCLES 120
`endif

`include "UartStates.vh"


module Uart8Transmitter_tb;
    parameter Tt     = 20; // clock timout

    reg       clk;
    reg       en;
    reg       start;
    reg [7:0] in;
    reg       out;
    reg       done;
    reg       busy;

    Uart8Transmitter utx (
        .clk    ( clk    ),
        .en     ( en     ),
        .start  ( start  ),
        .in     ( in     ),
        .out    ( out    ),
        .done   ( done   ),
        .busy   ( busy   )
    );

    // simulation init
    initial begin
        clk = 0;
        forever clk = #(Tt/2) ~clk;
    end

    initial begin
        rst_n   = 0;
        repeat (4)  @(posedge clk);
        rst_n   = 1;
    end

    //register file reset
    integer i;
    initial begin
        for (i = 0; i < 32; i = i + 1) begin
            sm_top.sm_cpu.rf.rf[i] = 0;
        end
    end

    task disasmInstr (
        input [31:0] instr
    );
        reg        [ 5:0] cmdOper;
        reg        [ 5:0] cmdFunk;
        reg        [ 4:0] cmdRs;
        reg        [ 4:0] cmdRt;
        reg        [ 4:0] cmdRd;
        reg        [ 4:0] cmdSa;
        reg        [15:0] cmdImm;
        reg signed [15:0] cmdImmS;

        begin
            cmdOper = instr[31:26];
            cmdFunk = instr[ 5:0 ];
            cmdRs   = instr[25:21];
            cmdRt   = instr[20:16];
            cmdRd   = instr[15:11];
            cmdSa   = instr[10:6 ];
            cmdImm  = instr[15:0 ];
            cmdImmS = instr[15:0 ];

            $write("   ");

            casez( {cmdOper,cmdFunk} )
                default               : if (instr == 32'b0) begin
                                            $write ("nop");
                                        end else begin
                                            $write ("new/unknown");
                                        end

                { `C_SPEC,  `F_ADDU } : $write ("addu  $%1d, $%1d, $%1d", cmdRd, cmdRs, cmdRt);
                { `C_SPEC,  `F_OR   } : $write ("or    $%1d, $%1d, $%1d", cmdRd, cmdRs, cmdRt);
                { `C_SPEC,  `F_SRL  } : $write ("srl   $%1d, $%1d, $%1d", cmdRd, cmdRs, cmdRt);
                { `C_SPEC,  `F_SLTU } : $write ("sltu  $%1d, $%1d, $%1d", cmdRd, cmdRs, cmdRt);
                { `C_SPEC,  `F_SUBU } : $write ("subu  $%1d, $%1d, $%1d", cmdRd, cmdRs, cmdRt);

                { `C_ADDIU, `F_ANY  } : $write ("addiu $%1d, $%1d, %1d", cmdRt, cmdRs, cmdImm);
                { `C_LUI,   `F_ANY  } : $write ("lui   $%1d, %1d",       cmdRt, cmdImm);

                { `C_BEQ,   `F_ANY  } : $write ("beq   $%1d, $%1d, %1d", cmdRs, cmdRt, cmdImmS + 1);
                { `C_BNE,   `F_ANY  } : $write ("bne   $%1d, $%1d, %1d", cmdRs, cmdRt, cmdImmS + 1);

                { `C_SPEC,  `F_XOR  } : $write ("xor   $%1d, $%1d, %1d", cmdRd, cmdRs, cmdRt);
                { `C_XORI,  `F_ANY  } : $write ("xori  $%1d, $%1d, %1d", cmdRd, cmdRs, cmdImm);
                { `C_SPEC,  `F_JR   } : $write ("jr    $%1d", cmdRs);
                { `C_SPEC,  `F_SLL  } : $write ("sll   $%1d, $%1d, %1d", cmdRd, cmdRs, cmdImm);

                { `C_LIB,  `F_ANY   } : $write ("lib   $%1d, $%1d", cmdRd, cmdImm);
            endcase
        end
    endtask

    //simulation debug output
    integer cycle; initial cycle = 0;

    initial regAddr = 0; // get PC

    always @(posedge clk) begin
        $write ("%5d  pc = %2d  pcaddr = %h  instr = %h   v0 = %1d",
                  cycle, regData, (regData << 2), sm_top.sm_cpu.instr, sm_top.sm_cpu.rf.rf[2]);

        disasmInstr(sm_top.sm_cpu.instr);

        $write("\n");

        cycle = cycle + 1;

        if (cycle > `SIMULATION_CYCLES) begin
            $display ("Timeout");
            $stop;
        end
    end

endmodule
