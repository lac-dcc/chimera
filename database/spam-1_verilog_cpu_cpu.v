// This program was cloned from: https://github.com/Johnlon/spam-1
// License: Mozilla Public License 2.0

// License: Mozilla Public License : Version 2.0
// Author : John Lonergan

// FIXME: Add random number generator - eg use an unused device as a readonly source - connect it to a 8 bit counter running at an arbitraty speed

// NB..
// ADDRESSING TERMINOLOGY
//  IMMEDIATE ADDRESSING = INSTRUCTION CONTAINS THE CONSTANT VALUE DATA TO USE
// RAM:
//  DIRECT ADDRESSING = INSTRUCTION CONTAINS THE ADDRESS IN MEMORY OF THE DATA TO USE
//  REGISTER ADDRESSING = INSTRUCTION CONTAINS THE NAME OF THE REGISTER FROM WHICH TO FETCH THE DATA

//#!/usr/bin/iverilog -Ttyp -Wall -g2012 -gspecify -o test.vvp 
`include "../cpu/controller.v"
`include "../cpu/ports.v"
`include "../reset/reset.v"
`include "../registerFile/syncRegisterFile.v"
`include "../pc/pc.v"
`include "../lib/assertion.v"
`include "../74245/hct74245.v"
`include "../74574/hct74574.v"
`include "../7474/hct7474.v"
`include "../74139/hct74139.v"
`include "../74377/hct74377.v"
`include "../rom/rom.v"
`include "../ram/ram.v"
`include "../alu/alu.v"
`include "../uart/um245r.v"
`include "../portController/portController.v"
`include "../gamepadAdapter/gamepadAdapter.v"


// verilator lint_off ASSIGNDLY
// verilator lint_off STMTDLY

`timescale 1ns/1ns

`define SEMICOLON ;
`define COMMA ,

`define MAX_INST_LEN 200
typedef reg[`MAX_INST_LEN:0][7:0] string_bits;
typedef reg[15:0] reg16;


// "Do not use an asynchronous reset within your design." - https://zipcpu.com/blog/2017/08/21/rules-for-newbies.html
module cpu(
    input _RESET_SWITCH,
    input system_clk
);

    import ports::*;

    int cycleCount = 0;

    parameter LOG=0;

    localparam tPD_7402=7;
    
    tri0 [15:0] address_bus;
    tri0 [7:0] abus; // when NA device is selected we don't want Z going into ALU sim as this is not a value so we get X out
    tri0 [7:0] bbus;
    tri [7:0] alu_result_bus;
    wire [2:0] abus_dev;
    wire [3:0] bbus_dev;
    wire [4:0] targ_dev;
    wire [4:0] alu_op;
    wire [7:0] _registered_flags_czonENGL;
    wire _flag_di;
    wire _flag_do;
    wire _set_flags;

    wire _mrPC;

    wire _phase_exec;
    wire phase_exec;

    reset RESET(
        .system_clk,
        ._RESET_SWITCH,
        ._phase_exec(_phase_exec), //?? not used
        .phase_exec(phase_exec),
        ._mrNeg(_mrPC)
    );



    // CONTROL ===========================================================================================
    wire _addrmode_register;

    // selection wires
    `define WIRE_ADEV_SEL(DNAME) wire _adev_``DNAME``
    `define WIRE_BDEV_SEL(DNAME) wire _bdev_``DNAME``
    `define WIRE_TDEV_SEL(DNAME) wire _``DNAME``_in

    `CONTROL_WIRES(WIRE, `SEMICOLON);

    `define BIND_ADEV_SEL(DNAME) ._adev_``DNAME``
    `define BIND_BDEV_SEL(DNAME) ._bdev_``DNAME``
    `define BIND_TDEV_SEL(DNAME) ._``DNAME``_in

    wire [7:0] PCHI, PCLO; // output of PC
    wire [15:0] pc_addr = {PCHI, PCLO}; 

    // ROM =============================================================================================
    controller ctrl( // DONE
        .pc(pc_addr),
        ._flags_czonENGL(_registered_flags_czonENGL),
        ._flag_di, ._flag_do,

        ._addrmode_register, 
        `CONTROL_WIRES(BIND, `COMMA),
        .address_bus,
        .bbus,
        .alu_op,
        .bbus_dev, .abus_dev, .targ_dev,
        ._set_flags
    );

    

    // PROGRAM COUNTER ======================================================================================

    // PC reset is sync with +ve edge of clock
    pc #(.LOG(0))  PC ( // DONE
        .clk(system_clk),
        ._MR(_mrPC),
        ._pc_in(_pc_in),  // load both
        ._pclo_in(_pclo_in), // load lo
        ._pchitmp_in(_pchitmp_in), // load tmp
        .D(alu_result_bus),

        .PCLO(PCLO),
        .PCHI(PCHI)
    );


    // PORT CONTROLLER  =============================================================================================
    wire  [15:0] _port_sel_wr;
    wire  [15:0] _port_sel_rd;

    portController port_ctrl(
        .data( alu_result_bus ),
        ._portsel_in, 
        ._port_wr(_port_in), 
        ._port_rd(_bdev_port),
        ._port_sel_wr, 
        ._port_sel_rd 
    );

    gamepadAdapter game_port(
        ._OErandom(_port_sel_rd[PORT_RD_RANDOM]), 
        ._OEpad1(_port_sel_rd[PORT_RD_GAMEPAD1]),
        ._OEpad2(_port_sel_rd[PORT_RD_GAMEPAD2]),
       .Q(bbus) 
    );

    // FIXME: JUST HARD CODE FOR NOW
    wire [7:0] parallelPortLoopback;

    hct74574 parallelport_out(.D(alu_result_bus), .Q(parallelPortLoopback), .CLK(_port_sel_wr[PORT_WR_PARALLEL]), ._OE(1'b0)); // DONE
    hct74245 parallelport_in(.A(bbus), .B(parallelPortLoopback), .nOE(_port_sel_rd[PORT_RD_PARALLEL]), .dir(1'b0)); // DONE

    reg [7:0] timer1=0; // timer will be 0 unless time is remaining
    reg timer1_OE=0;
    assign bbus = timer1_OE? timer1: 8'bz;

    always @(negedge system_clk) begin
        // execute
        if (!_port_sel_wr[PORT_WR_TIMER1]) begin
            timer1 = alu_result_bus;
        end
    end

    always @* begin
        if (!_port_sel_rd[PORT_RD_TIMER1]) begin
           $display("ENABLE READ TIMER1"); 
        end else begin
           $display("DISABLE READ TIMER1"); 
        end
        timer1_OE=!_port_sel_rd[PORT_RD_TIMER1];
    end


    // RAM =============================================================================================

// verilator lint_off PINMISSING
    wire #(8) _gated_ram_in = _phase_exec | _ram_in; // DONE - THIS IS ON THE RAM BOARD
    //OK to leave _OE enabled all the time as ram data sheet says WE override it
    ram #(.AWIDTH(16), .LOG(0), .UNDEFINED_VALUE(1'b0)) ram64(._WE(_gated_ram_in), ._OE(1'b0), .A(address_bus)); // DONE
// verilator lint_on PINMISSING
    
`ifndef verilator
    // verilator complains about tristate
    hct74245 ram_alubus_buf(.A(alu_result_bus), .B(ram64.D), .nOE(_ram_in), .dir(1'b1)); // DONE
`endif
    hct74245 ram_bbus_buf(.A(bbus), .B(ram64.D), .nOE(_bdev_ram), .dir(1'b0)); // DONE

    // MAR =============================================================================================
// verilator lint_off PINMISSING
    // clocks data in as we enter phase exec - on the +ve edge - so use positive logic phase_exec here
    hct74377 #(.LOG(0)) MARLO(._EN(_marlo_in), .CP(phase_exec), .D(alu_result_bus));   // DONE  
    hct74377 #(.LOG(0)) MARHI(._EN(_marhi_in), .CP(phase_exec), .D(alu_result_bus)); // DONE
// verilator lint_on PINMISSING

    hct74245 marlo_abus_buf(.A(MARLO.Q), .B(abus), .nOE(_adev_marlo), .dir(1'b1)); // DONE
    hct74245 marlo_bbus_buf(.A(MARLO.Q), .B(bbus), .nOE(_bdev_marlo), .dir(1'b1)); // DONE

    hct74245 marhi_abus_buf(.A(MARHI.Q), .B(abus), .nOE(_adev_marhi), .dir(1'b1)); // DONE
    hct74245 marhi_bbus_buf(.A(MARHI.Q), .B(bbus), .nOE(_bdev_marhi), .dir(1'b1)); // DONE

    hct74245 #(.LOG(0)) marhi_addbbushi_buf(.A(MARHI.Q), .B(address_bus[15:8]), .nOE(_addrmode_register), .dir(1'b1)); // DONE
    hct74245 #(.LOG(0)) marlo_addbbuslo_buf(.A(MARLO.Q), .B(address_bus[7:0]), .nOE(_addrmode_register), .dir(1'b1)); // DONE

    // BUS PULLDOWN - hardware has 10k array on the ALU input lines
    pulldown a_pd0(abus[0]);
    pulldown a_pd1(abus[1]);
    pulldown a_pd2(abus[2]);
    pulldown a_pd3(abus[3]);
    pulldown a_pd4(abus[4]);
    pulldown a_pd5(abus[5]);
    pulldown a_pd6(abus[6]);
    pulldown a_pd7(abus[7]);

    pulldown b_pd0(bbus[0]);
    pulldown b_pd1(bbus[1]);
    pulldown b_pd2(bbus[2]);
    pulldown b_pd3(bbus[3]);
    pulldown b_pd4(bbus[4]);
    pulldown b_pd5(bbus[5]);
    pulldown b_pd6(bbus[6]);
    pulldown b_pd7(bbus[7]);
    

    // ALU ==============================================================================================
    wire _flag_c_out, _flag_z_out, _flag_o_out, _flag_n_out, _flag_gt_out, _flag_lt_out, _flag_eq_out, _flag_ne_out;
    wire _flag_c, _flag_z, _flag_n, _flag_o, _flag_gt, _flag_lt, _flag_eq, _flag_ne;

	alu #(.LOG(0)) Alu( // DONE
        .result(alu_result_bus), 
        .a(abus),
        .b(bbus),
        .alu_op(alu_op),
        ._flag_c_in(_flag_c),
        ._flag_c(_flag_c_out),
        ._flag_z(_flag_z_out),
        ._flag_o(_flag_o_out),
        ._flag_n(_flag_n_out),
        ._flag_gt(_flag_gt_out),
        ._flag_lt(_flag_lt_out),
        ._flag_eq(_flag_eq_out),
        ._flag_ne(_flag_ne_out)
    );

    wire gated_flags_clk;
    nor #(tPD_7402) ic7402_gating_b( gated_flags_clk , _phase_exec , _set_flags); // LOW when _set_flags is high or _phase_exec is high / HIGH WHEN _pe is low AND _sf IS LOW

    wire [7:0] alu_flags_czonENGL = {_flag_c_out , _flag_z_out, _flag_o_out, _flag_n_out, _flag_eq_out, _flag_ne_out, _flag_gt_out, _flag_lt_out};

    hct74574 #(.LOG(LOG)) status_register_czonENGL( .D(alu_flags_czonENGL), // DONE
                                       .Q(_registered_flags_czonENGL),
                                        .CLK(gated_flags_clk), 
                                        ._OE(1'b0)); 

    assign {_flag_c, _flag_z, _flag_o, _flag_n, _flag_eq, _flag_ne, _flag_gt, _flag_lt} = _registered_flags_czonENGL;

    // REGISTER FILE =====================================================================================
    // INTERESTING THAT THE SELECTION LOGIC DOESN'T CONSIDER REGD - THIS SIMPLIFIED VALUE DOMAIN CONSIDERING ONLY THE FOUR ACTIVE LOW STATES NEEDS JUST THIS SIMPLE LOGIC FOR THE ADDRESSING
    // NOTE !!!! THIS CODE USES _phase_exec AS THE REGFILE GATING MEANING _WE IS LOW ONLY ON SECOND PHASE OF CLOCK - THIS PREVENTS A SPURIOUS WRITE TO REGFILE FROM IT'S INPUT LATCH
    wire _regfile_in, gated_regfile_in_tmp, _gated_regfile_in;

    // SOLUTION !! 4 input AND by using two spare 3 ip and's on 7411 on the ALU 
    and #(11) ic7411_regfile_in(_regfile_in , _rega_in , _regb_in , _regc_in , _regd_in); // DONE

    // NOTE targ regX_in lines are gated with do_exec in the controller but we still need to gate with _phase_exec as we only want them enabled in the late phase as they are latches
    nor #(tPD_7402) ic7402_gating_d(gated_regfile_in_tmp , _phase_exec , _regfile_in); // DONE
    nor #(tPD_7402) ic7402_gating_c(_gated_regfile_in , gated_regfile_in_tmp); // DONE

    // OPTIMISATION ! THIS WORKS alternative logic ... _regfile_rdL_en === abus_dev[2]
    // So ... wire #(8) _regfile_rdL_en = _adev_rega &_adev_regb &_adev_regc &_adev_regd ; 
    // is same as ...
    wire _regfile_rdL_en = abus_dev[2]; 

    // OLD wire #(8) _regfile_rdR_en = _bdev_rega &_bdev_regb &_bdev_regc &_bdev_regd ; 
    wire _regfile_rdR_en;
    // SOLUTION: DONT USE 7432, USE 'A' gate on 7402 NOR of ALU and one invertor on 7404 of ALU
    or #(11) regfile_rdR_7432(_regfile_rdR_en , bbus_dev[2], bbus_dev[3]); // NOT IMPL TODO WIRE THIS OR IN THE HARDWARE !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

    // the lower two bits can be used to address the regfile as the regfile is the first four locns
    wire [1:0] regfile_rdL_addr = abus_dev[1:0]; 
    wire [1:0] regfile_rdR_addr = bbus_dev[1:0];
    wire [1:0] regfile_wr_addr = targ_dev[1:0];

    if (LOG) begin
        always @* $display("regfile _gated_regfile_in = ", _gated_regfile_in, " wr addr  ", regfile_wr_addr, " in : a=%b b=%b c=%b d=%b " , _rega_in , _regb_in , _regc_in , _regd_in);
        always @* $display("regfile _regfile_rdL_en   = ", _regfile_rdL_en, " rd addr  ", regfile_rdL_addr, " in : a=%b b=%b c=%b d=%b " , _adev_rega , _adev_regb , _adev_regc , _adev_regd);
        always @* $display("regfile _regfile_rdR_en   = ", _regfile_rdR_en, " rd addr  ", regfile_rdR_addr, " in : a=%b b=%b c=%b d=%b " , _bdev_rega , _bdev_regb , _bdev_regc , _bdev_regd);
    end


    // clocks data in as we enter phase exec - on the +ve edge - so use positive logic phase_exec here
    syncRegisterFile #(.LOG(0)) regFile(
        .clk(phase_exec),               // clock only on the execute phase edge otherwise we will clock in results during fetch and decode and act more like a combinatorial circuit
        ._wr_en(_gated_regfile_in),     // only enabled for write during the execute phase by which time the write address select lines are stable
        .wr_addr(regfile_wr_addr),
        .wr_data(alu_result_bus),
        
        ._rdL_en(_regfile_rdL_en),
        .rdL_addr(regfile_rdL_addr),
        .rdL_data(abus),
        
        ._rdR_en(_regfile_rdR_en),
        .rdR_addr(regfile_rdR_addr),
        .rdR_data(bbus)
    );


    // UART =============================================================
    wire #(10) _gated_uart_wr = _uart_in | _phase_exec;   // DONE sync clock data into uart - must occur AFTER uart_alubuf_buf has been enabled

    wire [7:0] uart_d;

    um245r #(.LOG(2))  uart ( // DONE
        .D(uart_d),
        .WR(_gated_uart_wr),// Writes data on -ve edge
        ._RD(_adev_uart),	// When goes from high to low then the FIFO data is placed onto D (equates to _OE)
        ._TXE(_flag_do),	// When high do NOT write data using WR, when low write data by strobing WR
        ._RXF(_flag_di)		// When high to NOT read from D, when low then data is available to read by strobing RD low
      );

    hct74245 uart_alubus_buf(.A(alu_result_bus), .B(uart_d), .nOE(_uart_in), .dir(1'b1)); // DONE
    hct74245 uart_abus_buf(.A(uart_d), .B(abus), .nOE(_adev_uart), .dir(1'b1)); // DONE



    always @(pc_addr) begin
        if ($isunknown(pc_addr)) begin // just check leftmost but as this is part of the op and is mandatory
            $display ("%9t ", $time,  "CPU ERROR");
            $error("CPU : ERROR - UNKNOWN PC %4h", pc_addr); 
            `FINISH_AND_RETURN(1);
        end
        // not a problem unless we're out of RESET
        if ($isunknown(ctrl.rom_6.Mem[pc_addr][7])) begin // just check leftmost but as this is part of the op and is mandatory
            $display ("%9t ", $time,  "CPU ERROR");
            $error("CPU : END OF PROGRAM - NO CODE FOUND AT PC %4h = %8b", pc_addr, ctrl.rom_6.Mem[pc_addr][7]); 
//            `FINISH_AND_RETURN(1);
// FIXME = add finish and return but only fail of _RESET=1 ie out of reset and still not got program
        end
    end
    always @(negedge system_clk) begin
        if (_mrPC && $isunknown(alu_result_bus)) begin // just check leftmost but as this is part of the op and is mandatory
            $display ("%9t ", $time,  "CPU ERROR");
            $error("CPU : ERROR - ALU RESULT BUS UNDEFINED AT EXECUTE : ALU = %8b, A = %8b, B = %8b, OP = %2d, ADDRESS = %4h", alu_result_bus, abus, bbus, alu_op, address_bus); 
            //`FINISH_AND_RETURN(1);
        end
    end


    int halt_code;
    // neg edge is start of execute
    always @(negedge system_clk) begin
        cycleCount ++;

        if (_halt_in == 0) begin
            halt_code = (MARHI.Q  << 8) + MARLO.Q;

            // leave space around the code as Verification.scala looks for them to extract the value
            $display("----------------------------- CYCLES %d",  cycleCount);
            $display("----------------------------- HALTED <%1d h:%04x> <%1d h:%02x> ---------------------------", 
                        halt_code, 16'(halt_code),
                        alu_result_bus, 8'(alu_result_bus));
            DUMP;
            $finish();
        end
    end

    function string disasmCur();
        string msg;
    begin
        disasmCur = $sformatf( " PC=%1d _do_exec=%1d   %s", 
                ctrl.PC.pcval,
                ctrl._do_exec,
                disasm(ctrl.instruction) 
            );
    end
    endfunction

    function string disasm([47:0] INSTRUCTION);
         reg [4:0] i_aluop;
         reg [3:0] i_target;
         reg [2:0] i_srca;
         reg [2:0] i_srcb_lo;
         reg [3:0] i_cond;
         reg i_flag;
         reg i_cmode;
         reg i_srcb_hi;
         reg i_tdev4;
         reg i_amode;
         reg [23:8] i_addr ;
         reg [7:0] i_immed;
         reg [3:0] i_srcb;
         reg [4:0] i_targ;
    begin
        import alu_ops::*;
        import control::*;

        i_aluop = INSTRUCTION[47:43]; 
        i_target = INSTRUCTION[42:39]; 
        i_srca = INSTRUCTION[38:36]; 
        i_srcb_lo = INSTRUCTION[35:33]; 
        i_cond = INSTRUCTION[32:29]; 
        i_flag = INSTRUCTION[28]; 
        i_cmode = INSTRUCTION[27]; 
        i_srcb_hi = INSTRUCTION[26]; 
        i_tdev4 = INSTRUCTION[25]; 
        i_amode= INSTRUCTION[24]; 
        i_addr = INSTRUCTION[23:8]; 
        i_immed= INSTRUCTION[7:0]; 

        i_srcb   = {i_srcb_hi, i_srcb_lo};
        i_targ   = {i_tdev4, i_target};

        disasm = $sformatf(
                    "op:(%2d)%-10s", i_aluop, alu_ops::aluopName(i_aluop), 
                    "  t:(%2d)%-6s", i_targ, tdevname(i_targ), 
                    " a:(%2d)%-8s", i_srca, adevname(i_srca),  
                    " b:(%2d)%-10s", i_srcb, bdevname(i_srcb),  
                    "  cond:(%1d)%2s", i_cond, condname(i_cond),  
                    " setf:(%b)%s", i_flag, (i_flag? "SET" : "NOSET"), 
                    " cmode:(%b)%s", i_cmode, (i_cmode? "INV" : "STD"), 
                    " amode:(%1b)%s", i_amode, (i_amode?  "DIR": "REG"), 
                    " addr:(%1d)%04x", i_addr, i_addr, 
                    " immed:(%1d)%02x", i_immed, i_immed
        ); 
    end 
    endfunction

   // $timeformat [(unit_number, precision, suffix, min_width )] ;
    task DUMP;
         //   DUMP_OP;
            `define DD $display ("%9t ", $time,  "DUMP  ", 

            `DD " phase_exec=%1d", phase_exec);
            `DD " PC=%1d (PC=0x%4h) PCHItmp=%d (%2x)", pc_addr, pc_addr, PC.PCHITMP, PC.PCHITMP);
            `DD " instruction=%08b:%08b:%08b:%08b:%08b:%08b", ctrl.instruction_6, ctrl.instruction_5, ctrl.instruction_4, ctrl.instruction_3, ctrl.instruction_2, ctrl.instruction_1);
            `DD " condition=%02d(%1s) _do_exec=%b _set_flags=%b", ctrl.condition, control::condname(ctrl.condition), ctrl._do_exec, _set_flags);
            `DD " tdev=%5b(%s)", targ_dev, control::tdevname(targ_dev),
                " adev=%3b(%s)", abus_dev, control::adevname(abus_dev),
                " bdev=%4b(%s)", bbus_dev,control::bdevname(bbus_dev),
                " alu_op=%5b(%s)", alu_op, alu_ops::aluopName(alu_op)
            );            
            `DD " immed8=%-d (0x%02x)", ctrl.immed8, ctrl.immed8);
            `DD " abus=%-d bbus=%-d alu_result_bus=%-d", abus, bbus, alu_result_bus);
            `DD " ram=%-d (0x%02x)", ram64.D, ram64.D, " address_bus=%0d (%04x) mode=%1s", address_bus, address_bus, control::amode(_addrmode_register));
            `DD " flags alu _czonENGL=%8b ", alu_flags_czonENGL, " registered=%8b gated_flags_clk=%1b", status_register_czonENGL.Q, gated_flags_clk, " _do=%b _di=%b", _flag_do, _flag_di);
            `DD " MAR=%d:%d (0x%02x:%02x)", MARHI.Q, MARLO.Q, MARHI.Q, MARLO.Q);
            `DD " REGA:%08b", regFile.get(0),
                 "  REGB:%08b", regFile.get(1),
                 "  REGC:%08b", regFile.get(2),
                 "  REGD:%08b", regFile.get(3)
                 );
            `DD " PORTSEL=%8b (WR=%s  RD=%s)", port_ctrl.port_sel_reg.Q, 
                    ports::portNameWR(port_ctrl.port_sel_reg.Q),
                    ports::portNameRD(port_ctrl.port_sel_reg.Q)
                );
            `DD " PORT=%8b", port_ctrl.port_sel_reg.Q);
            `DD " TIMER1=%8b", timer1);

            `define LOGX_ADEV_SEL(DNAME) " _adev_``DNAME``=%1b", _adev_``DNAME``
            `define LOGX_BDEV_SEL(DNAME) " _bdev_``DNAME``=%1b", _bdev_``DNAME``
            `define LOGX_TDEV_SEL(DNAME) " _``DNAME``_in=%1b",  _``DNAME``_in
            // $display("%9t", $time, " DUMP   WIRES ", `CONTROL_WIRES(LOGX, `COMMA));
    endtask 

endmodule : cpu
