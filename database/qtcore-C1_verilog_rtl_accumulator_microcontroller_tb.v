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

module qtcore_a1_4baddr_scan_test (

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

    reg [7:0] io_in;
    wire [7:0] io_out;
    wire scan_out, halt_out;
    wire int_out;
    reg clk_in;
    reg scan_in, proc_en_in, scan_enable_in;
    reg rst_in;


    accumulator_microcontroller dut(
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
        #(CLK_PERIOD);
        rst_in = 0;
        #(CLK_PERIOD);
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
        $dumpfile("qtcore_a1_4baddr_scan_test.vcd");
        $dumpvars(0, qtcore_a1_4baddr_scan_test);
        scan_chain = 'b0;
        `ifdef SCAN_ONLY
            $display("SCAN ONLY");
        `endif
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
            if(dut.ctrl_unit.state_register.internal_data !== 3'b001) begin
                $display("Wrong state reg value");
                $finish;
            end
            if(dut.SEG_Register.internal_data !== 4'b0000) begin
                $display("Wrong SEG reg value");
                $finish;
            end
            if(dut.PC_Register.internal_data !== 8'h10) begin
                $display("Wrong PC reg value");
                $finish;
            end
            if(dut.IR_Register.internal_data !== 8'hfe) begin
                $display("Wrong IR reg value");
                $finish;
            end
            if(dut.ACC_Register.internal_data !== 8'h0c) begin
                $display("Wrong ACC reg value (value is %b)", dut.ACC_Register.internal_data);
                $finish;
            end
            if(dut.csr_inst.segexe_l_reg.internal_data !== 8'hff) begin
                $display("Wrong SEGEXE_L reg value");
                $finish;
            end
            if(dut.csr_inst.segexe_h_reg.internal_data !== 8'h00) begin
                $display("Wrong SEGEXE_H reg value");
                $finish;
            end
            if(dut.csr_inst.io_in_reg.internal_data !== 8'h00) begin
                $display("Wrong IO_IN reg value");
                $finish;
            end
            if(dut.csr_inst.io_out_reg.internal_data !== 8'hff) begin
                $display("Wrong IO_OUT reg value");
                $finish;
            end
            if(dut.csr_inst.cnt_l_reg.internal_data !== 8'h00) begin
                $display("Wrong CNT_L reg value");
                $finish;
            end
            if(dut.csr_inst.cnt_h_reg.internal_data !== 8'hff) begin
                $display("Wrong CNT_H reg value");
                $finish;
            end
            if(dut.csr_inst.status_ctrl_reg.internal_data !== 8'h00) begin
                $display("Wrong STATUS_CTRL reg value");
                $finish;
            end
            if(dut.csr_inst.temp_reg.internal_data !== 8'hff) begin
                $display("Wrong TEMP reg value");
                $finish;
            end
            // for(i = 0; i < FULL_MEM_SIZE; i = i + 1) begin //can't do this for some reason?
            //     if(dut.mem_bank.memory[i].mem_cell.internal_data !== i) begin
            //         $display("Wrong mem[%d] reg value", i);
            //         $finish;
            //     end
            // end
            if(dut.mem_bank.memory[0].mem_cell.internal_data !== 8'h00) begin
                $display("Wrong mem[0] reg value, got %b", dut.mem_bank.memory[0].mem_cell.internal_data);
                $finish;
            end
            if(dut.mem_bank.memory[1].mem_cell.internal_data !== 8'h01) begin
                $display("Wrong mem[1] reg value");
                $finish;
            end
            if(dut.mem_bank.memory[2].mem_cell.internal_data !== 8'h02) begin
                $display("Wrong mem[2] reg value");
                $finish;
            end
            //skip to 16
            if(dut.mem_bank.memory[16].mem_cell.internal_data !== 8'h10) begin
                $display("Wrong mem[16] reg value");
                $finish;
            end
            //skip to 80
            if(dut.mem_bank.memory[80].mem_cell.internal_data !== 8'h50) begin
                $display("Wrong mem[80] reg value");
                $finish;
            end
            //skip to 123
            if(dut.mem_bank.memory[123].mem_cell.internal_data !== 8'h7b) begin
                $display("Wrong mem[123] reg value");
                $finish;
            end
            //skip to 199
            if(dut.mem_bank.memory[199].mem_cell.internal_data !== 8'hc7) begin
                $display("Wrong mem[199] reg value");
                $finish;
            end
            //skip to 254
            if(dut.mem_bank.memory[254].mem_cell.internal_data !== 8'hfe) begin
                $display("Wrong mem[254] reg value");
                $finish;
            end
            //skip to 255
            if(dut.mem_bank.memory[255].mem_cell.internal_data !== 8'hff) begin
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

        /*

        $display("TEST 3");

        scan_chain[2:0] = 3'b001;  //state = fetch
        scan_chain[7:3] = 5'h0;    //PC = 0
        scan_chain[15:8] = 8'h00; //IR = 0
        scan_chain[23:16] = 8'h00; //ACC = 0x00
        scan_chain[31 -: 8] = 8'b00010000;
        scan_chain[39 -: 8] = 8'b11100001;
        scan_chain[47 -: 8] = 8'b00100000;
        scan_chain[55 -: 8] = 8'b01010000;
        scan_chain[63 -: 8] = 8'b00100001;
        scan_chain[71 -: 8] = 8'b01110000;
        scan_chain[79 -: 8] = 8'b00100010;
        scan_chain[87 -: 8] = 8'b10001111;
        scan_chain[95 -: 8] = 8'b00100011;
        scan_chain[103 -: 8] = 8'b10101110;
        scan_chain[111 -: 8] = 8'b00100100;
        scan_chain[119 -: 8] = 8'b11001101;
        scan_chain[127 -: 8] = 8'b00100101;
        scan_chain[135 -: 8] = 8'b11111111;
        scan_chain[143 -: 8] = 8'b00000100;
        scan_chain[151 -: 8] = 8'b00001111;
        scan_chain[159 -: 8] = 8'b00001010;
        scan_chain[199 -: 16] = 16'hd5ce;

        //RESET PROCESSOR
        scan_enable_in = 0;
        proc_en_in = 0;
        scan_in = 0;
        reset_processor;
        //SCAN
        xchg_scan_chain;
        //RUN PROCESSOR UNTIL HALT
        run_processor_until_halt(256, i);
        if(scan_out != 1) begin
            $display("Program failed to halt");
            $finish;
        end
        $display("Program halted after %d clock cycles", i);
        //SCAN OUT
        xchg_scan_chain;

        if(scan_chain[31+8*0 -: 8] !== 11) begin
            $display("MEM[0] wrong value");
            $finish;
        end
        if(scan_chain[31+8*1 -: 8] !== 21) begin
            $display("MEM[1] wrong value");
            $finish;
        end
        if(scan_chain[31+8*2 -: 8] !== 11) begin
            $display("MEM[2] wrong value");
            $finish;
        end
        if(scan_chain[31+8*3 -: 8] !== 11) begin
            $display("MEM[3] wrong value");
            $finish;
        end
        if(scan_chain[31+8*4 -: 8] !== 15) begin
            $display("MEM[4] wrong value");
            $finish;
        end
        if(scan_chain[31+8*5 -: 8] !== 8'hf0) begin
            $display("MEM[5] wrong value");
            $finish;
        end
        $display("Memory values correct after scanout");

        $display("TEST 4");

        scan_chain[2:0] = 3'b001;  //state = fetch
        scan_chain[7:3] = 5'h0;    //PC = 0
        scan_chain[15:8] = 8'h00; //IR = 0
        scan_chain[23:16] = 8'h00; //ACC = 0x00
        scan_chain[31 -: 8] = 8'b00010000;
        scan_chain[39 -: 8] = 8'b11110110;
        scan_chain[47 -: 8] = 8'b00100000;
        scan_chain[55 -: 8] = 8'b11110111;
        scan_chain[63 -: 8] = 8'b00100001;
        scan_chain[71 -: 8] = 8'b11111000;
        scan_chain[79 -: 8] = 8'b00100010;
        scan_chain[87 -: 8] = 8'b11111001;
        scan_chain[95 -: 8] = 8'b00100011;
        scan_chain[103 -: 8] = 8'b11111010;
        scan_chain[111 -: 8] = 8'b00100100;
        scan_chain[119 -: 8] = 8'b11111100;
        scan_chain[127 -: 8] = 8'b00100101;
        scan_chain[135 -: 8] = 8'b11111101;
        scan_chain[143 -: 8] = 8'b11111110;
        scan_chain[151 -: 8] = 8'b00100110;
        scan_chain[159 -: 8] = 8'b00001010;
        scan_chain[199 -: 16] = 16'hd5ce;

        //RESET PROCESSOR
        scan_enable_in = 0;
        proc_en_in = 0;
        scan_in = 0;
        reset_processor;
        //SCAN
        xchg_scan_chain;
        //RUN PROCESSOR UNTIL HALT
        run_processor_until_halt(256, i);
        if(scan_out != 1) begin
            $display("Program failed to halt");
            $finish;
        end
        $display("Program halted after %d clock cycles", i);
        //SCAN OUT
        xchg_scan_chain;

        if(scan_chain[31+8*0 -: 8] !== 20) begin
            $display("MEM[0] wrong value");
            $finish;
        end
        if(scan_chain[31+8*1 -: 8] !== 10) begin
            $display("MEM[1] wrong value");
            $finish;
        end
        if(scan_chain[31+8*2 -: 8] !== 160) begin
            $display("MEM[2] wrong value");
            $finish;
        end
        if(scan_chain[31+8*3 -: 8] !== 65) begin
            $display("MEM[3] wrong value");
            $finish;
        end
        if(scan_chain[31+8*4 -: 8] !== 160) begin
            $display("MEM[4] wrong value");
            $finish;
        end
        if(scan_chain[31+8*5 -: 8] !== 159) begin
            $display("MEM[5] wrong value");
            $finish;
        end
        if(scan_chain[31+8*6 -: 8] !== 255) begin
            $display("MEM[5] wrong value");
            $finish;
        end
        $display("Memory values correct after scanout");

        $display("TEST 5: BTN/LED");

        scan_chain[2:0] = 3'b001;  //state = fetch
        scan_chain[7:3] = 5'h0;    //PC = 0
        scan_chain[15:8] = 8'h00; //IR = 0
        scan_chain[23:16] = 8'h00; //ACC = 0x00
        scan_chain[31 -: 8] = 8'b00010011;
        scan_chain[39 -: 8] = 8'b10010000;
        scan_chain[47 -: 8] = 8'b11110101;
        scan_chain[55 -: 8] = 8'b00010011;
        scan_chain[63 -: 8] = 8'b10010000;
        scan_chain[71 -: 8] = 8'b11110011;
        scan_chain[79 -: 8] = 8'b00001110;
        scan_chain[87 -: 8] = 8'b11010000;
        scan_chain[95 -: 8] = 8'b00101110;
        scan_chain[103 -: 8] = 8'b11101110;
        scan_chain[111 -: 8] = 8'b11111011;
        scan_chain[119 -: 8] = 8'b00110011;
        scan_chain[127 -: 8] = 8'b11111101;
        scan_chain[135 -: 8] = 8'b11110000;
        scan_chain[143 -: 8] = 8'b00000000;
        scan_chain[151 -: 8] = 8'b00011000;
        scan_chain[159 -: 8] = 8'b00000001;
        scan_chain[167 -: 8] = 8'b00000000;
        scan_chain[175 -: 8] = 8'b00000000;
        scan_chain[199 -: 16] = 16'hd5ce;


        //RESET PROCESSOR
        scan_enable_in = 0;
        proc_en_in = 0;
        scan_in = 0;
        reset_processor;
        //SCAN
        xchg_scan_chain;
        //RUN PROCESSOR FOR 32 cycles at a time (should not halt)
        btn_in = 0;
        run_processor_until_halt(32, i);
        btn_in = 1;
        run_processor_until_halt(32, i);
        
        if(led_out != 7'h0c) begin
            $display("LEDs wrong value");
            $finish;
        end

        btn_in = 0;
        run_processor_until_halt(32, i);
        btn_in = 1;
        run_processor_until_halt(32, i);
        
        if(led_out != 7'h00) begin
            $display("LEDs wrong value");
            $finish;
        end

        btn_in = 0;
        run_processor_until_halt(32, i);
        btn_in = 1;
        run_processor_until_halt(32, i);
        
        if(led_out != 7'h0c) begin
            $display("LEDs wrong value");
            $finish;
        end

        btn_in = 0;
        run_processor_until_halt(32, i);
        btn_in = 0;
        run_processor_until_halt(32, i);
        
        if(led_out != 7'h0c) begin
            $display("LEDs wrong value (should not have changed, btn=1 missing)");
            $finish;
        end
        
        $display("BTN/LED values correct");

        $display("TEST 6: 7SEG");
        scan_chain[2:0] = 3'b001;  //state = fetch
        scan_chain[7:3] = 5'h0;    //PC = 0
        scan_chain[15:8] = 8'h00; //IR = 0
        scan_chain[23:16] = 8'h00; //ACC = 0x00
        scan_chain[31 -: 8] = 8'b00010000;
        scan_chain[39 -: 8] = 8'b01010100;
        scan_chain[47 -: 8] = 8'b11111011;
        scan_chain[55 -: 8] = 8'b00110011;
        scan_chain[63 -: 8] = 8'b00010000;
        scan_chain[71 -: 8] = 8'b11100001;
        scan_chain[79 -: 8] = 8'b00110000;
        scan_chain[87 -: 8] = 8'b11111101;
        scan_chain[95 -: 8] = 8'b11110000;
        scan_chain[103 -: 8] = 8'b00000000;
        scan_chain[111 -: 8] = 8'b00000000;
        scan_chain[119 -: 8] = 8'b00000000;
        scan_chain[127 -: 8] = 8'b00000000;
        scan_chain[135 -: 8] = 8'b00000000;
        scan_chain[143 -: 8] = 8'b00000000;
        scan_chain[151 -: 8] = 8'b00000000;
        scan_chain[159 -: 8] = 8'b00000000;
        scan_chain[167 -: 8] = 8'b00000000;
        scan_chain[175 -: 8] = 8'b00000000;
        scan_chain[199 -: 16] = 16'hd5ce;


        //RESET PROCESSOR
        scan_enable_in = 0;
        proc_en_in = 0;
        scan_in = 0;
        reset_processor;
        //SCAN
        xchg_scan_chain;
        //RUN PROCESSOR FOR 16 cycles at a time (should not halt)
        run_processor_until_halt(18, i);
        if(led_out != 7'b0111111) begin //first output value: "0"
            $display("LEDs wrong value 0: %b", led_out);
            $finish;
        end
        run_processor_until_halt(18, i);
        if(led_out != 7'b0000110) begin //first output value: "1"
            $display("LEDs wrong value 1");
            $finish;
        end
        run_processor_until_halt(18, i);
        if(led_out != 7'b1011011) begin //first output value: "2"
            $display("LEDs wrong value 2");
            $finish;
        end
        run_processor_until_halt(18, i);
        if(led_out != 7'b1001111) begin //first output value: "3"
            $display("LEDs wrong value 3 %b", led_out);
            $finish;
        end
        run_processor_until_halt(18, i);
        if(led_out != 7'b1100110) begin //first output value: "4"
            $display("LEDs wrong value 4");
            $finish;
        end
        run_processor_until_halt(18, i);
        if(led_out != 7'b1101101) begin //first output value: "5"
            $display("LEDs wrong value 5");
            $finish;
        end
        run_processor_until_halt(18, i);
        if(led_out != 7'b1111100) begin //first output value: "6"
            $display("LEDs wrong value");
            $finish;
        end
        run_processor_until_halt(18, i);
        if(led_out != 7'b0000111) begin //first output value: "7"
            $display("LEDs wrong value");
            $finish;
        end
        run_processor_until_halt(18, i);
        if(led_out != 7'b1111111) begin //first output value: "8"
            $display("LEDs wrong value");
            $finish;
        end
        run_processor_until_halt(18, i);
        if(led_out != 7'b1100111) begin //first output value: "9"
            $display("LEDs wrong value");
            $finish;
        end

        $display("All segment counting correct");
        
        
        fid = $fopen("TEST_PASSES.txt", "w");
        $fwrite(fid, "TEST_PASSES");
        $fclose(fid); //*/
        $display("TEST_PASSES");
     end
    
endmodule
