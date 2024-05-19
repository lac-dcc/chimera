// This program was cloned from: https://github.com/kiwih/qtcore-C1
// License: Apache License 2.0

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: New York University
// Engineer: Hammond Pearce
// 
// Last Edited Date: 04/19/2023
//////////////////////////////////////////////////////////////////////////////////

`default_nettype none

module qtcore_c1_4baddr_scan_test (

    );
    
 localparam CLK_PERIOD = 50;
    localparam CLK_HPERIOD = CLK_PERIOD/2;

    localparam FULL_MEM_SIZE = 256; //includes the IO register and the scan registers
    localparam SCAN_CHAIN_SIZE = 8 + 3*8 + 8*8 + (FULL_MEM_SIZE * 8);

    localparam SCAN_CU_INDEX = 1;
    localparam SCAN_SEG_INDEX = 4;
    localparam SCAN_PC_INDEX = 8;
    localparam SCAN_IR_INDEX = 16;
    localparam SCAN_ACC_INDEX = 24;
    localparam SCAN_CSR_SEGEXE_L_INDEX = 32;
    localparam SCAN_CSR_SEGEXE_H_INDEX = 40;
    localparam SCAN_CSR_IO_IN_INDEX = 48;
    localparam SCAN_CSR_IO_OUT_INDEX = 56;
    localparam SCAN_CSR_CNT_L_INDEX = 64;
    localparam SCAN_CSR_CNT_H_INDEX = 72;
    localparam SCAN_CSR_STATUS_CTRL_INDEX = 80;
    localparam SCAN_CSR_TEMP_INDEX = 88;
    localparam SCAN_MEM0_INDEX = 96;

    localparam DO_TEST_0 = 1;
    localparam DO_TEST_1 = 1;
    localparam DO_TEST_2 = 1;
    localparam DO_TEST_3 = 1;
    localparam DO_TEST_4 = 1;
    localparam DO_TEST_IRQ = 1;

    reg [7:0] io_in;
    wire [7:0] io_out;
    wire scan_out, halt_out;
    wire int_out;
    reg clk_in;
    reg scan_in, proc_en_in, scan_enable_in;
    reg rst_in;


    /*accumulator_microcontroller uut.qtcore_C1_p0(
        .clk(clk_in),
        .rst(rst_in),
        .scan_enable(scan_enable_in),
        .scan_in(scan_in),
        .scan_out(scan_out),
        .proc_en(proc_en_in),
        .halt(halt_out),
        .INT_out(int_out),
        .IO_in(io_in),
        .IO_out(io_out)
    );*/

    wire [127:0] la_data_in;
    wire [127:0] la_data_out;
    wire  [127:0] la_oenb;

    assign la_oenb[64] = 0;
    assign la_data_in[64] = clk_in;
    assign la_oenb[65] = 0;
    assign la_data_in[65] = rst_in;
    assign la_oenb[66] = 0;
    assign la_data_in[66] = scan_in;
    assign la_oenb[67] = 0;
    assign la_data_in[67] = scan_enable_in;
    assign la_oenb[68] = 0;
    assign la_data_in[68] = proc_en_in;

    // assign la_data_out = {23'b0,                //23 [127 - 103]
    //                       p0_proc_en_final,     //1  [104]
    //                       p0_halt_out,          //1  [103]
    //                       p0_irq_out,           //1  [102]
    //                       p0_scan_enable_final, //1  [101]
    //                       p0_scan_enable,       //1  [100]
    //                       p0_scan_in_final,     //1  [99]
    //                       p0_scan_in,           //1  [98]
    //                       p0_scan_out,          //1  [97]
    //                       p0_proc_go,           //1  [96]
    //                       p0_scan_done_strobe,  //1  [95]
    //                       p0_scan_in_progress,  //1  [94]
    //                       p0_scan_go,           //1  [93]
    //                       p0_scan_cnt,          //5  [92 - 88]
    //                       p0_sig_in_reg,        //8  [87 - 80]
    //                       p0_io_out,            //8  [79 - 72]
    //                       io_in_reg,            //8  [71 - 64]
    //                       p0_scan_wbs,          //32 [63 - 32]
    //                       p0_scan_io};          //32 [31 - 0]

    assign scan_out = la_data_out[97];
    assign io_out = la_data_out[79:72];
    assign int_out = la_data_out[102];
    assign halt_out = la_data_out[103];

    user_proj_example uut (
        .wb_clk_i(1'b0),
        .wb_rst_i(1'b0),
        .wbs_stb_i(1'b0),
        .wbs_cyc_i(1'b0),
        .wbs_we_i(1'b0),
        .wbs_sel_i(4'b0),
        .wbs_dat_i(32'b0),
        .wbs_adr_i(32'b0),
        .la_data_in(la_data_in),
        .la_data_out(la_data_out),
        .la_oenb(la_oenb),
        .io_in({io_in, 8'b0})
    );
    
    
    reg [SCAN_CHAIN_SIZE-1:0] scan_chain;     
    //2:0   - state
    //7:3   - PC
    //15:8  - IR
    //23:16 - ACC
    //31:24 - MEM[0]    
    //etc
    reg spi_miso_cap;
    integer i;
    integer fid;

    task xchg_scan_chain;
    integer i;
    begin
        scan_enable_in = 1; //asert low chip select
        for (i = 0; i < SCAN_CHAIN_SIZE; i = i + 1) begin
            scan_in = scan_chain[SCAN_CHAIN_SIZE-1];
            #(CLK_PERIOD / 2);
            clk_in = 1;
            spi_miso_cap = scan_out;
            #(CLK_PERIOD / 2);
            clk_in = 0;
            scan_chain = {scan_chain[SCAN_CHAIN_SIZE-2:0], spi_miso_cap};
        end
        #(CLK_PERIOD);
        scan_enable_in = 0;
    end
    endtask

    task reset_processor;
    begin
        rst_in = 1;
        //clk_in = 1;
        #(CLK_PERIOD / 2);
        //clk_in = 0;
        #(CLK_PERIOD / 2);
        rst_in = 0;
        //clk_in = 1;
        #(CLK_PERIOD / 2);
        //clk_in = 0;
        #(CLK_PERIOD / 2);
    end
    endtask

    task run_processor_until_halt(
        input integer max_cycles,
        output integer n_cycles
    );
    begin
        proc_en_in = 1;
        for (n_cycles = 0; n_cycles < max_cycles && (n_cycles < 4 || halt_out == 0) ; n_cycles = n_cycles + 1) begin //two cycles per instruction, this should execute 4 instr
            #(CLK_PERIOD / 2);
            clk_in = 1;
            #(CLK_PERIOD / 2);
            clk_in = 0;
        end
        proc_en_in = 0;
    end
    endtask

    initial begin
        $dumpfile("qtcore_c1_4baddr_scan_test.vcd");
        $dumpvars(0, qtcore_c1_4baddr_scan_test);
        scan_chain = 'b0;
        io_in = 'b0;
        `ifdef SCAN_ONLY
            $display("SCAN ONLY");
        `endif

        if (DO_TEST_0) begin
            $display("TEST 0 (SCAN CHAIN LOAD/UNLOAD)");

            // TEST PART 1: LOAD SCAN CHAIN

            scan_chain = 'b0;
            scan_chain[SCAN_CU_INDEX +: 3] = 3'b001; //state = fetch
            scan_chain[SCAN_SEG_INDEX +: 4] = 4'b0000; //SEG = 0
            scan_chain[SCAN_PC_INDEX +: 8] = 8'h10;    //PC = 16
            scan_chain[SCAN_IR_INDEX +: 8] = 8'hfe; //IR = 0xFE
            scan_chain[SCAN_ACC_INDEX +: 8] = 8'h0C; //ACC = 0x0C
            scan_chain[SCAN_CSR_SEGEXE_L_INDEX +: 8] = 8'hFF; //SEGEXE_L = 0xFF
            scan_chain[SCAN_CSR_SEGEXE_H_INDEX +: 8] = 8'h00; //SEGEXE_H = 0x00
            scan_chain[SCAN_CSR_IO_IN_INDEX +: 8] = 8'h00; //IO_IN = 0x00
            scan_chain[SCAN_CSR_IO_OUT_INDEX +: 8] = 8'hFF; //IO_OUT = 0xFF
            scan_chain[SCAN_CSR_CNT_L_INDEX +: 8] = 8'h00; //CNT_L = 0x00
            scan_chain[SCAN_CSR_CNT_H_INDEX +: 8] = 8'hFF; //CNT_H = 0xFF
            scan_chain[SCAN_CSR_STATUS_CTRL_INDEX +: 8] = 8'h00; //STATUS_CTRL = 0x00
            scan_chain[SCAN_CSR_TEMP_INDEX +: 8] = 8'hFF; //TEMP = 0xFF
            for (i = 0; i < FULL_MEM_SIZE; i = i + 1) begin
                scan_chain[SCAN_MEM0_INDEX + 8*i +: 8] = i; //MEM[i] = i
            end
            // scan_chain[SCAN_MEM0_INDEX +: 8] = 8'hde; //MEM[0] = 0xde
            // scan_chain[SCAN_MEM0_INDEX+8 +: 8] = 8'had; //MEM[1] = 0xad
            // scan_chain[SCAN_MEM0_INDEX+16 +: 8] = 8'hc0; //MEM[2] = 0xc0
            // scan_chain[SCAN_MEM0_INDEX+24 +: 8] = 8'hde; //MEM[3] = 0xde

            //scan_chain[2:0] = 3'b001;  
            /*scan_chain[7:3] = 5'h1;    //PC = 1
            scan_chain[15:8] = 8'he0; //IR = ADDI 0 (NOP), should get overrwritten by MEM[2]
            scan_chain[23:16] = 8'h01; //ACC = 0x01
            scan_chain[31 -: 8] = 8'he0; //MEM[0] = 0xE0
            scan_chain[39 -: 8] = 8'he1; //MEM[1] = 0xE1 (ADDI 1)
            scan_chain[47 -: 8] = 8'he2; //MEM[2] = 0xE2 (ADDI 2)
            scan_chain[55 -: 8] = 8'he3; //MEM[3] = 0xE3 (ADDI 3)
            scan_chain[63 -: 8] = 8'he4; //MEM[4] = 0xE4 (ADDI 4)

            scan_chain[SCAN_CHAIN_SIZE-17 -: 8] = 8'hF0; //write to the IO register
            scan_chain[199 -: 16] = 16'hd5ce;*/

            scan_enable_in = 0;
            proc_en_in = 0;
            scan_in = 0;
            clk_in = 0;
            rst_in = 0;
            io_in = 0;
            
            //TEST 0: reset the processor
            reset_processor;
            
            xchg_scan_chain;
            
            

            `ifndef SCAN_ONLY
                $display("Design not gatelevel, running internal checks");
                if(uut.qtcore_C1_p0.ctrl_unit.state_register.internal_data !== 3'b001) begin
                    $display("Wrong state reg value");
                    $finish;
                end
                if(uut.qtcore_C1_p0.SEG_Register.internal_data !== 4'b0000) begin
                    $display("Wrong SEG reg value");
                    $finish;
                end
                if(uut.qtcore_C1_p0.PC_Register.internal_data !== 8'h10) begin
                    $display("Wrong PC reg value");
                    $finish;
                end
                if(uut.qtcore_C1_p0.IR_Register.internal_data !== 8'hfe) begin
                    $display("Wrong IR reg value");
                    $finish;
                end
                if(uut.qtcore_C1_p0.ACC_Register.internal_data !== 8'h0c) begin
                    $display("Wrong ACC reg value (value is %b)", uut.qtcore_C1_p0.ACC_Register.internal_data);
                    $finish;
                end
                if(uut.qtcore_C1_p0.csr_inst.segexe_l_reg.internal_data !== 8'hff) begin
                    $display("Wrong SEGEXE_L reg value");
                    $finish;
                end
                if(uut.qtcore_C1_p0.csr_inst.segexe_h_reg.internal_data !== 8'h00) begin
                    $display("Wrong SEGEXE_H reg value");
                    $finish;
                end
                if(uut.qtcore_C1_p0.csr_inst.io_in_reg.internal_data !== 8'h00) begin
                    $display("Wrong IO_IN reg value");
                    $finish;
                end
                if(uut.qtcore_C1_p0.csr_inst.io_out_reg.internal_data !== 8'hff) begin
                    $display("Wrong IO_OUT reg value");
                    $finish;
                end
                if(uut.qtcore_C1_p0.csr_inst.cnt_l_reg.internal_data !== 8'h00) begin
                    $display("Wrong CNT_L reg value");
                    $finish;
                end
                if(uut.qtcore_C1_p0.csr_inst.cnt_h_reg.internal_data !== 8'hff) begin
                    $display("Wrong CNT_H reg value");
                    $finish;
                end
                if(uut.qtcore_C1_p0.csr_inst.status_ctrl_reg.internal_data !== 8'h00) begin
                    $display("Wrong STATUS_CTRL reg value");
                    $finish;
                end
                if(uut.qtcore_C1_p0.csr_inst.sig_in_reg.internal_data !== 8'hff) begin
                    $display("Wrong TEMP reg value");
                    $finish;
                end
                // for(i = 0; i < FULL_MEM_SIZE; i = i + 1) begin //can't do this for some reason?
                //     if(uut.qtcore_C1_p0.mem_bank.memory[i].mem_cell.internal_data !== i) begin
                //         $display("Wrong mem[%d] reg value", i);
                //         $finish;
                //     end
                // end
                if(uut.qtcore_C1_p0.mem_bank.memory[0].mem_cell.internal_data !== 8'h00) begin
                    $display("Wrong mem[0] reg value, got %b", uut.qtcore_C1_p0.mem_bank.memory[0].mem_cell.internal_data);
                    $finish;
                end
                if(uut.qtcore_C1_p0.mem_bank.memory[1].mem_cell.internal_data !== 8'h01) begin
                    $display("Wrong mem[1] reg value");
                    $finish;
                end
                if(uut.qtcore_C1_p0.mem_bank.memory[2].mem_cell.internal_data !== 8'h02) begin
                    $display("Wrong mem[2] reg value");
                    $finish;
                end
                //skip to 16
                if(uut.qtcore_C1_p0.mem_bank.memory[16].mem_cell.internal_data !== 8'h10) begin
                    $display("Wrong mem[16] reg value");
                    $finish;
                end
                //skip to 80
                if(uut.qtcore_C1_p0.mem_bank.memory[80].mem_cell.internal_data !== 8'h50) begin
                    $display("Wrong mem[80] reg value");
                    $finish;
                end
                //skip to 123
                if(uut.qtcore_C1_p0.mem_bank.memory[123].mem_cell.internal_data !== 8'h7b) begin
                    $display("Wrong mem[123] reg value");
                    $finish;
                end
                //skip to 199
                if(uut.qtcore_C1_p0.mem_bank.memory[199].mem_cell.internal_data !== 8'hc7) begin
                    $display("Wrong mem[199] reg value");
                    $finish;
                end
                //skip to 254
                if(uut.qtcore_C1_p0.mem_bank.memory[254].mem_cell.internal_data !== 8'hfe) begin
                    $display("Wrong mem[254] reg value");
                    $finish;
                end
                //skip to 255
                if(uut.qtcore_C1_p0.mem_bank.memory[255].mem_cell.internal_data !== 8'hff) begin
                    $display("Wrong mem[255] reg value");
                    $finish;
                end
                
            `endif

            $display("Scan load successful");
            
            //TEST PART B: UNLOAD SCAN CHAIN 
            
            xchg_scan_chain;
            
            if(scan_chain[SCAN_CU_INDEX +: 3] !== 3'b001) begin //state = fetch
                $display("Wrong unloaded state reg, got %b", scan_chain[SCAN_CU_INDEX +: 3]);
                $finish;
            end
            if(scan_chain[SCAN_SEG_INDEX +: 4] !== 4'b0000) begin //SEG = 0
                $display("Wrong unloaded SEG reg");
                $finish;
            end
            if(scan_chain[SCAN_PC_INDEX +: 8] !== 8'h10) begin    //PC = 16
                $display("Wrong unloaded PC reg");
                $finish;
            end
            if(scan_chain[SCAN_IR_INDEX +: 8] !== 8'hfe) begin //IR = 0xFE
                $display("Wrong unloaded IR reg");
                $finish;
            end
            if(scan_chain[SCAN_ACC_INDEX +: 8] !== 8'h0C) begin //ACC = 0x0C
                $display("Wrong unloaded ACC reg");
                $finish;
            end
            if(scan_chain[SCAN_CSR_SEGEXE_L_INDEX +: 8] !== 8'hFF) begin //SEGEXE_L = 0xFF
                $display("Wrong unloaded SEGEXE_L reg");
                $finish;
            end
            if(scan_chain[SCAN_CSR_SEGEXE_H_INDEX +: 8] !== 8'h00) begin //SEGEXE_H = 0x00
                $display("Wrong unloaded SEGEXE_H reg");
                $finish;
            end
            if(scan_chain[SCAN_CSR_IO_IN_INDEX +: 8] !== 8'h00) begin //IO_IN = 0x00
                $display("Wrong unloaded IO_IN reg");
                $finish;
            end
            if(scan_chain[SCAN_CSR_IO_OUT_INDEX +: 8] !== 8'hFF) begin //IO_OUT = 0xFF
                $display("Wrong unloaded IO_OUT reg");
                $finish;
            end
            if(scan_chain[SCAN_CSR_CNT_L_INDEX +: 8] !== 8'h00) begin //CNT_L = 0x00
                $display("Wrong unloaded CNT_L reg");
                $finish;
            end
            if(scan_chain[SCAN_CSR_CNT_H_INDEX +: 8] !== 8'hFF) begin //CNT_H = 0xFF
                $display("Wrong unloaded CNT_H reg");
                $finish;
            end
            if(scan_chain[SCAN_CSR_STATUS_CTRL_INDEX +: 8] !== 8'h00) begin //STATUS_CTRL = 0x00
                $display("Wrong unloaded STATUS_CTRL reg");
                $finish;
            end
            if(scan_chain[SCAN_CSR_TEMP_INDEX +: 8] !== 8'hFF) begin //TEMP = 0xFF
                $display("Wrong unloaded TEMP reg");
                $finish;
            end
            for (i = 0; i < FULL_MEM_SIZE; i = i + 1) begin
                if(scan_chain[SCAN_MEM0_INDEX + 8*i +: 8] !== i) begin //MEM[i] = i
                    $display("Wrong unloaded mem[%d] reg", i);
                    $finish;
                end
            end
            $display("Unload scan chain successful");
        end
        
        if(DO_TEST_1) begin
            $display("TEST 1: test_1.asm");
            scan_chain = 'b0;
            scan_chain[SCAN_CU_INDEX +: 3] = 3'b001; //state = fetch
            scan_chain[SCAN_SEG_INDEX +: 4] = 4'b0000; //SEG = 0
            scan_chain[SCAN_PC_INDEX +: 8] = 8'h00;    //PC = 00
            scan_chain[SCAN_IR_INDEX +: 8] = 8'h00; //IR = 0x00
            scan_chain[SCAN_ACC_INDEX +: 8] = 8'h00; //ACC = 0x00
            scan_chain[SCAN_CSR_SEGEXE_L_INDEX +: 8] = 8'hFF; //SEGEXE_L = 0xFF
            scan_chain[SCAN_CSR_SEGEXE_H_INDEX +: 8] = 8'h00; //SEGEXE_H = 0x00
            scan_chain[SCAN_CSR_IO_IN_INDEX +: 8] = 8'h00; //IO_IN = 0x00
            scan_chain[SCAN_CSR_IO_OUT_INDEX +: 8] = 8'h00; //IO_OUT = 0x00
            scan_chain[SCAN_CSR_CNT_L_INDEX +: 8] = 8'h00; //CNT_L = 0x00
            scan_chain[SCAN_CSR_CNT_H_INDEX +: 8] = 8'h00; //CNT_H = 0x00
            scan_chain[SCAN_CSR_STATUS_CTRL_INDEX +: 8] = 8'h00; //STATUS_CTRL = 0x00
            scan_chain[SCAN_CSR_TEMP_INDEX +: 8] = 8'h00; //TEMP = 0x00

            scan_chain[SCAN_MEM0_INDEX + 0*8 +: 8] = 8'b00001111;
            scan_chain[SCAN_MEM0_INDEX + 1*8 +: 8] = 8'b11000011;
            scan_chain[SCAN_MEM0_INDEX + 2*8 +: 8] = 8'b11111100;
            scan_chain[SCAN_MEM0_INDEX + 3*8 +: 8] = 8'b00011111;
            scan_chain[SCAN_MEM0_INDEX + 4*8 +: 8] = 8'b11011010;
            scan_chain[SCAN_MEM0_INDEX + 5*8 +: 8] = 8'b10011111;
            scan_chain[SCAN_MEM0_INDEX + 6*8 +: 8] = 8'b10000000;
            scan_chain[SCAN_MEM0_INDEX + 7*8 +: 8] = 8'b10001111;
            scan_chain[SCAN_MEM0_INDEX + 8*8 +: 8] = 8'b10000001;
            scan_chain[SCAN_MEM0_INDEX + 9*8 +: 8] = 8'b00011110;
            scan_chain[SCAN_MEM0_INDEX + 10*8 +: 8] = 8'b11001010;
            scan_chain[SCAN_MEM0_INDEX + 11*8 +: 8] = 8'b11111111;
            scan_chain[SCAN_MEM0_INDEX + 15*8 +: 8] = 8'b00010000;

            
            //RESET PROCESSOR
            scan_enable_in = 0;
            proc_en_in = 0;
            scan_in = 0;
            reset_processor;
            //SCAN
            xchg_scan_chain;
            //RUN PROCESSOR UNTIL HALT
            run_processor_until_halt(256, i);
            if(halt_out != 1) begin
                $display("Program failed to halt, halt_out=%b", halt_out);
                $finish;
            end
            $display("Program halted after %d clock cycles", i);
            //SCAN OUT
            xchg_scan_chain;

            if(scan_chain[SCAN_MEM0_INDEX + 15*8 +: 8] !== 8'h0) begin
                $display("MEM[15] wrong value");
                $finish;
            end
            if(scan_chain[SCAN_MEM0_INDEX + 14*8 +: 8] !== 8'h1) begin
                $display("MEM[14] wrong value %d", scan_chain[24+16*8 -: 8]);
                $finish;
            end
            $display("Memory values correct after scanout");
        end

        if(DO_TEST_2) begin

            $display("TEST 2 - test_2.asm");
            scan_chain = 'b0;
            scan_chain[SCAN_CU_INDEX +: 3] = 3'b001; //state = fetch
            scan_chain[SCAN_SEG_INDEX +: 4] = 4'b0000; //SEG = 0
            scan_chain[SCAN_PC_INDEX +: 8] = 8'h00;    //PC = 00
            scan_chain[SCAN_IR_INDEX +: 8] = 8'h00; //IR = 0x00
            scan_chain[SCAN_ACC_INDEX +: 8] = 8'h00; //ACC = 0x00
            scan_chain[SCAN_CSR_SEGEXE_L_INDEX +: 8] = 8'hFF; //SEGEXE_L = 0xFF
            scan_chain[SCAN_CSR_SEGEXE_H_INDEX +: 8] = 8'h00; //SEGEXE_H = 0x00
            scan_chain[SCAN_CSR_IO_IN_INDEX +: 8] = 8'h00; //IO_IN = 0x00
            scan_chain[SCAN_CSR_IO_OUT_INDEX +: 8] = 8'h00; //IO_OUT = 0x00
            scan_chain[SCAN_CSR_CNT_L_INDEX +: 8] = 8'h00; //CNT_L = 0x00
            scan_chain[SCAN_CSR_CNT_H_INDEX +: 8] = 8'h00; //CNT_H = 0x00
            scan_chain[SCAN_CSR_STATUS_CTRL_INDEX +: 8] = 8'h00; //STATUS_CTRL = 0x00
            scan_chain[SCAN_CSR_TEMP_INDEX +: 8] = 8'h00; //TEMP = 0x00

            scan_chain[SCAN_MEM0_INDEX + 0*8 +: 8] = 8'b11111101;
            scan_chain[SCAN_MEM0_INDEX + 1*8 +: 8] = 8'b10000101;
            scan_chain[SCAN_MEM0_INDEX + 2*8 +: 8] = 8'b11110001;
            scan_chain[SCAN_MEM0_INDEX + 3*8 +: 8] = 8'b11111111;
            scan_chain[SCAN_MEM0_INDEX + 4*8 +: 8] = 8'b00001010;
            scan_chain[SCAN_MEM0_INDEX + 5*8 +: 8] = 8'b00010000;
            scan_chain[SCAN_MEM0_INDEX + 6*8 +: 8] = 8'b00000100;
            scan_chain[SCAN_MEM0_INDEX + 7*8 +: 8] = 8'b11010011;
            scan_chain[SCAN_MEM0_INDEX + 9*8 +: 8] = 8'b11110000;
            scan_chain[SCAN_MEM0_INDEX + 10*8 +: 8] = 8'b11111100;
            scan_chain[SCAN_MEM0_INDEX + 11*8 +: 8] = 8'b00010100;
            scan_chain[SCAN_MEM0_INDEX + 12*8 +: 8] = 8'b11111101;
            scan_chain[SCAN_MEM0_INDEX + 13*8 +: 8] = 8'b10000110;
            scan_chain[SCAN_MEM0_INDEX + 14*8 +: 8] = 8'b11110000;


            //RESET PROCESSOR
            scan_enable_in = 0;
            proc_en_in = 0;
            scan_in = 0;
            reset_processor;
            //SCAN
            xchg_scan_chain;
            //RUN PROCESSOR UNTIL HALT
            run_processor_until_halt(256, i);
            if(halt_out != 1) begin
                $display("Program failed to halt, halt_out=%b", halt_out);
                $finish;
            end
            $display("Program halted after %d clock cycles", i);
            //SCAN OUT
            xchg_scan_chain;

            if(scan_chain[SCAN_MEM0_INDEX + 3*8 +: 8] !== 8'hFF) begin
                $display("MEM[3] wrong value");
                $finish;
            end

            if(scan_chain[SCAN_MEM0_INDEX + 4*8 +: 8] !== 8'h00) begin
                $display("MEM[4] wrong value");
                $finish;
            end

            $display("Memory values correct after scanout");
        end

        if(DO_TEST_3) begin
            $display("TEST 3 - test_3.asm");

            scan_chain = 'b0;
            scan_chain[SCAN_CU_INDEX +: 3] = 3'b001; //state = fetch
            scan_chain[SCAN_SEG_INDEX +: 4] = 4'b0000; //SEG = 0
            scan_chain[SCAN_PC_INDEX +: 8] = 8'h00;    //PC = 00
            scan_chain[SCAN_IR_INDEX +: 8] = 8'h00; //IR = 0x00
            scan_chain[SCAN_ACC_INDEX +: 8] = 8'h00; //ACC = 0x00
            scan_chain[SCAN_CSR_SEGEXE_L_INDEX +: 8] = 8'hFF; //SEGEXE_L = 0xFF
            scan_chain[SCAN_CSR_SEGEXE_H_INDEX +: 8] = 8'h00; //SEGEXE_H = 0x00
            scan_chain[SCAN_CSR_IO_IN_INDEX +: 8] = 8'h00; //IO_IN = 0x00
            scan_chain[SCAN_CSR_IO_OUT_INDEX +: 8] = 8'h00; //IO_OUT = 0x00
            scan_chain[SCAN_CSR_CNT_L_INDEX +: 8] = 8'h00; //CNT_L = 0x00
            scan_chain[SCAN_CSR_CNT_H_INDEX +: 8] = 8'h00; //CNT_H = 0x00
            scan_chain[SCAN_CSR_STATUS_CTRL_INDEX +: 8] = 8'h00; //STATUS_CTRL = 0x00
            scan_chain[SCAN_CSR_TEMP_INDEX +: 8] = 8'h00; //TEMP = 0x00

            scan_chain[SCAN_MEM0_INDEX + 0*8 +: 8] = 8'b00001111;
            scan_chain[SCAN_MEM0_INDEX + 1*8 +: 8] = 8'b10000001;
            scan_chain[SCAN_MEM0_INDEX + 2*8 +: 8] = 8'b00010000;
            scan_chain[SCAN_MEM0_INDEX + 3*8 +: 8] = 8'b00101111;
            scan_chain[SCAN_MEM0_INDEX + 4*8 +: 8] = 8'b00010001;
            scan_chain[SCAN_MEM0_INDEX + 5*8 +: 8] = 8'b00111101;
            scan_chain[SCAN_MEM0_INDEX + 6*8 +: 8] = 8'b00010010;
            scan_chain[SCAN_MEM0_INDEX + 7*8 +: 8] = 8'b11111101;
            scan_chain[SCAN_MEM0_INDEX + 8*8 +: 8] = 8'b10100001;
            scan_chain[SCAN_MEM0_INDEX + 9*8 +: 8] = 8'b10010001;
            scan_chain[SCAN_MEM0_INDEX + 10*8 +: 8] = 8'b11110000;
            scan_chain[SCAN_MEM0_INDEX + 13*8 +: 8] = 8'b00000100;
            scan_chain[SCAN_MEM0_INDEX + 14*8 +: 8] = 8'b00001111;
            scan_chain[SCAN_MEM0_INDEX + 15*8 +: 8] = 8'b00001010;
            scan_chain[SCAN_MEM0_INDEX + 16*8 +: 8] = 8'b11111101;
            scan_chain[SCAN_MEM0_INDEX + 17*8 +: 8] = 8'b10000001;
            scan_chain[SCAN_MEM0_INDEX + 18*8 +: 8] = 8'b00010000;
            scan_chain[SCAN_MEM0_INDEX + 19*8 +: 8] = 8'b10100000;
            scan_chain[SCAN_MEM0_INDEX + 20*8 +: 8] = 8'b00000010;
            scan_chain[SCAN_MEM0_INDEX + 21*8 +: 8] = 8'b01001110;
            scan_chain[SCAN_MEM0_INDEX + 22*8 +: 8] = 8'b00010011;
            scan_chain[SCAN_MEM0_INDEX + 23*8 +: 8] = 8'b10100010;
            scan_chain[SCAN_MEM0_INDEX + 24*8 +: 8] = 8'b11100010;
            scan_chain[SCAN_MEM0_INDEX + 25*8 +: 8] = 8'b11111111;
            scan_chain[SCAN_MEM0_INDEX + 26*8 +: 8] = 8'b01011110;
            scan_chain[SCAN_MEM0_INDEX + 27*8 +: 8] = 8'b00010001;
            scan_chain[SCAN_MEM0_INDEX + 28*8 +: 8] = 8'b01101101;
            scan_chain[SCAN_MEM0_INDEX + 29*8 +: 8] = 8'b00010010;
            scan_chain[SCAN_MEM0_INDEX + 30*8 +: 8] = 8'b11111111;
            scan_chain[SCAN_MEM0_INDEX + 45*8 +: 8] = 8'b11111111;
            scan_chain[SCAN_MEM0_INDEX + 46*8 +: 8] = 8'b00001110;




            //RESET PROCESSOR
            scan_enable_in = 0;
            proc_en_in = 0;
            scan_in = 0;
            reset_processor;
            //SCAN
            xchg_scan_chain;
            //RUN PROCESSOR UNTIL HALT
            run_processor_until_halt(256, i);
            if(halt_out != 1) begin
                $display("Program failed to halt");
                $finish;
            end
            $display("Program halted after %d clock cycles", i);
            //SCAN OUT
            xchg_scan_chain;

            if(scan_chain[SCAN_MEM0_INDEX + 0*8 +: 8] !== 11) begin
                $display("MEM[0] wrong value");
                $finish;
            end
            if(scan_chain[SCAN_MEM0_INDEX + 1*8 +: 8] !== 21) begin
                $display("MEM[1] wrong value");
                $finish;
            end
            if(scan_chain[SCAN_MEM0_INDEX + 2*8 +: 8] !== 17) begin
                $display("MEM[2] wrong value");
                $finish;
            end
            if(scan_chain[SCAN_MEM0_INDEX + 16*8 +: 8] !== 1) begin
                $display("MEM[16] wrong value");
                $finish;
            end
            if(scan_chain[SCAN_MEM0_INDEX + 3*8 +: 8] !== 1) begin
                $display("MEM[3] wrong value");
                $finish;
            end
            if(scan_chain[SCAN_MEM0_INDEX + 33*8 +: 8] !== 15) begin
                $display("MEM[33] wrong value");
                $finish;
            end
            if(scan_chain[SCAN_MEM0_INDEX + 34*8 +: 8] !== 8'hf0) begin
                $display("MEM[34] wrong value");
                $finish;
            end
            $display("Memory values correct after scanout");
        end

        if(DO_TEST_4) begin
            $display("TEST 4 - test_4.asm (Includes I/O, CSR, memory protect)");
            io_in = 8'h12;

            scan_chain = 'b0;
            scan_chain[SCAN_CU_INDEX +: 3] = 3'b001; //state = fetch
            scan_chain[SCAN_SEG_INDEX +: 4] = 4'b0000; //SEG = 0
            scan_chain[SCAN_PC_INDEX +: 8] = 8'h00;    //PC = 00
            scan_chain[SCAN_IR_INDEX +: 8] = 8'h00; //IR = 0x00
            scan_chain[SCAN_ACC_INDEX +: 8] = 8'h00; //ACC = 0x00
            scan_chain[SCAN_CSR_SEGEXE_L_INDEX +: 8] = 8'hFF; //SEGEXE_L = 0xFF
            scan_chain[SCAN_CSR_SEGEXE_H_INDEX +: 8] = 8'h00; //SEGEXE_H = 0x00
            scan_chain[SCAN_CSR_IO_IN_INDEX +: 8] = 8'h00; //IO_IN = 0x00
            scan_chain[SCAN_CSR_IO_OUT_INDEX +: 8] = 8'h00; //IO_OUT = 0x00
            scan_chain[SCAN_CSR_CNT_L_INDEX +: 8] = 8'h00; //CNT_L = 0x00
            scan_chain[SCAN_CSR_CNT_H_INDEX +: 8] = 8'h00; //CNT_H = 0x00
            scan_chain[SCAN_CSR_STATUS_CTRL_INDEX +: 8] = 8'h00; //STATUS_CTRL = 0x00
            scan_chain[SCAN_CSR_TEMP_INDEX +: 8] = 8'h00; //TEMP = 0x00

            scan_chain[SCAN_MEM0_INDEX + 0*8 +: 8] = 8'b11111101;
            scan_chain[SCAN_MEM0_INDEX + 1*8 +: 8] = 8'b10101111;
            scan_chain[SCAN_MEM0_INDEX + 3*8 +: 8] = 8'b10111011;
            scan_chain[SCAN_MEM0_INDEX + 4*8 +: 8] = 8'b10110010;
            scan_chain[SCAN_MEM0_INDEX + 5*8 +: 8] = 8'b00010000;
            scan_chain[SCAN_MEM0_INDEX + 6*8 +: 8] = 8'b11111101;
            scan_chain[SCAN_MEM0_INDEX + 7*8 +: 8] = 8'b10001111;
            scan_chain[SCAN_MEM0_INDEX + 8*8 +: 8] = 8'b10111000;
            scan_chain[SCAN_MEM0_INDEX + 9*8 +: 8] = 8'b10111001;
            scan_chain[SCAN_MEM0_INDEX + 10*8 +: 8] = 8'b11111101;
            scan_chain[SCAN_MEM0_INDEX + 11*8 +: 8] = 8'b11111010;
            scan_chain[SCAN_MEM0_INDEX + 12*8 +: 8] = 8'b00011110;
            scan_chain[SCAN_MEM0_INDEX + 13*8 +: 8] = 8'b11111101;
            scan_chain[SCAN_MEM0_INDEX + 14*8 +: 8] = 8'b10111100;
            scan_chain[SCAN_MEM0_INDEX + 15*8 +: 8] = 8'b10111101;
            scan_chain[SCAN_MEM0_INDEX + 16*8 +: 8] = 8'b10000010;
            scan_chain[SCAN_MEM0_INDEX + 17*8 +: 8] = 8'b10111110;
            scan_chain[SCAN_MEM0_INDEX + 18*8 +: 8] = 8'b10000000;
            scan_chain[SCAN_MEM0_INDEX + 19*8 +: 8] = 8'b10110100;
            scan_chain[SCAN_MEM0_INDEX + 20*8 +: 8] = 8'b10110100;
            scan_chain[SCAN_MEM0_INDEX + 21*8 +: 8] = 8'b00011101;
            scan_chain[SCAN_MEM0_INDEX + 22*8 +: 8] = 8'b10010011;
            scan_chain[SCAN_MEM0_INDEX + 23*8 +: 8] = 8'b11110000;
            scan_chain[SCAN_MEM0_INDEX + 48*8 +: 8] = 8'b11111101;
            scan_chain[SCAN_MEM0_INDEX + 49*8 +: 8] = 8'b10011111;
            scan_chain[SCAN_MEM0_INDEX + 50*8 +: 8] = 8'b10000001;
            scan_chain[SCAN_MEM0_INDEX + 51*8 +: 8] = 8'b00011111;
            scan_chain[SCAN_MEM0_INDEX + 52*8 +: 8] = 8'b11110000;
            scan_chain[SCAN_MEM0_INDEX + 240*8 +: 8] = 8'b00001111;
            scan_chain[SCAN_MEM0_INDEX + 241*8 +: 8] = 8'b11111101;
            scan_chain[SCAN_MEM0_INDEX + 242*8 +: 8] = 8'b11110000;




            //RESET PROCESSOR
            scan_enable_in = 0;
            proc_en_in = 0;
            scan_in = 0;
            reset_processor;
            //SCAN
            xchg_scan_chain;
            //RUN PROCESSOR UNTIL HALT
            run_processor_until_halt(256, i);
            if(halt_out != 1) begin
                $display("Program failed to halt");
                $finish;
            end
            $display("Program halted after %d clock cycles", i);
            //CHECK IO_OUT BEFORE SCAN_OUT (it will mess it up)
            if(io_out !== 15) begin //io_out = 15
                $display("IO_OUT wrong value (%b)", io_out);
                $finish;
            end
            //SCAN OUT
            xchg_scan_chain;

            if(scan_chain[SCAN_MEM0_INDEX + 240*8 +: 8] !== io_in) begin
                $display("MEM[240] wrong value (%b)", scan_chain[SCAN_MEM0_INDEX + 240*8 +: 8]);
                $finish;
            end
            if(scan_chain[SCAN_MEM0_INDEX + 252*8 +: 8] !== 8'h0) begin
                $display("MEM[253] wrong value (%b)", scan_chain[SCAN_MEM0_INDEX + 252*8 +: 8]);
                $finish;
            end
            if(scan_chain[SCAN_MEM0_INDEX + 253*8 +: 8] !== 8'h2) begin
                $display("MEM[253] wrong value (%b)", scan_chain[SCAN_MEM0_INDEX + 253*8 +: 8]);
                $finish;
            end
            if(scan_chain[SCAN_MEM0_INDEX + 254*8 +: 8] !== 8'b11111101) begin
                $display("MEM[254] wrong value (%b)", scan_chain[SCAN_MEM0_INDEX + 254*8 +: 8]);
                $finish;
            end
            if(scan_chain[SCAN_MEM0_INDEX + 255*8 +: 8] !== 8'hf1) begin
                $display("MEM[255] wrong value (%b)", scan_chain[SCAN_MEM0_INDEX + 255*8 +: 8]);
                $finish;
            end
            $display("IO_OUT correct and memory values correct after scanout");
        end

        if(DO_TEST_IRQ) begin
            $display("TEST IRQ - test_irq.asm (Emits INT_OUT)");
            io_in = 8'h12;

            scan_chain = 'b0;
            scan_chain[SCAN_CU_INDEX +: 3] = 3'b001; //state = fetch
            scan_chain[SCAN_SEG_INDEX +: 4] = 4'b0000; //SEG = 0
            scan_chain[SCAN_PC_INDEX +: 8] = 8'h00;    //PC = 00
            scan_chain[SCAN_IR_INDEX +: 8] = 8'h00; //IR = 0x00
            scan_chain[SCAN_ACC_INDEX +: 8] = 8'h00; //ACC = 0x00
            scan_chain[SCAN_CSR_SEGEXE_L_INDEX +: 8] = 8'hFF; //SEGEXE_L = 0xFF
            scan_chain[SCAN_CSR_SEGEXE_H_INDEX +: 8] = 8'h00; //SEGEXE_H = 0x00
            scan_chain[SCAN_CSR_IO_IN_INDEX +: 8] = 8'h00; //IO_IN = 0x00
            scan_chain[SCAN_CSR_IO_OUT_INDEX +: 8] = 8'h00; //IO_OUT = 0x00
            scan_chain[SCAN_CSR_CNT_L_INDEX +: 8] = 8'h00; //CNT_L = 0x00
            scan_chain[SCAN_CSR_CNT_H_INDEX +: 8] = 8'h00; //CNT_H = 0x00
            scan_chain[SCAN_CSR_STATUS_CTRL_INDEX +: 8] = 8'h00; //STATUS_CTRL = 0x00
            scan_chain[SCAN_CSR_TEMP_INDEX +: 8] = 8'h00; //TEMP = 0x00

            scan_chain[SCAN_MEM0_INDEX + 0*8 +: 8] = 8'b11111101;
            scan_chain[SCAN_MEM0_INDEX + 1*8 +: 8] = 8'b10000001;
            scan_chain[SCAN_MEM0_INDEX + 2*8 +: 8] = 8'b10111110;
            scan_chain[SCAN_MEM0_INDEX + 3*8 +: 8] = 8'b11111111;

            //RESET PROCESSOR
            scan_enable_in = 0;
            proc_en_in = 0;
            scan_in = 0;
            reset_processor;
            //SCAN
            xchg_scan_chain;
            if(int_out !== 0) begin
                $display("INT_out wrong value (%b)", int_out);
                $finish;
            end
            //RUN PROCESSOR UNTIL HALT
            run_processor_until_halt(12, i);
            if(halt_out != 1) begin
                $display("Program failed to halt");
                $finish;
            end
            $display("Program halted after %d clock cycles", i);
            //CHECK INT_OUT BEFORE SCAN_OUT (it will mess it up)
            if(int_out !== 1) begin
                $display("INT_out wrong value (%b)", int_out);
                $finish;
            end
            $display("INT_out correct");
            //no need to SCAN OUT for this test
            
        end

        
        
        /*
        fid = $fopen("TEST_PASSES.txt", "w");
        $fwrite(fid, "TEST_PASSES");
        $fclose(fid); //*/
        $display("TEST_PASSES");
     end
    
endmodule
