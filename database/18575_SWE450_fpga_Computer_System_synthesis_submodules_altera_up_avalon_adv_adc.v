// This program was cloned from: https://github.com/briancook247/SWE450
// License: MIT License

// (C) 2001-2018 Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions and other 
// software and tools, and its AMPP partner logic functions, and any output 
// files from any of the foregoing (including device programming or simulation 
// files), and any associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License Subscription 
// Agreement, Intel FPGA IP License Agreement, or other applicable 
// license agreement, including, without limitation, that your use is for the 
// sole purpose of programming logic devices manufactured by Intel and sold by 
// Intel or its authorized distributors.  Please refer to the applicable 
// agreement for further details.


// THIS FILE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
// THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
// FROM, OUT OF OR IN CONNECTION WITH THIS FILE OR THE USE OR OTHER DEALINGS
// IN THIS FILE.

//  - - - - - - - - - -ADC- - - - - - - - - - - - - - -
module altera_up_avalon_adv_adc (clock, reset, go, sclk, cs_n, din, dout, done, reading0, reading1, 
						reading2, reading3, reading4, reading5, reading6, reading7);
input go, dout, clock, reset;

output reg done;
output reg sclk, din, cs_n;
output reg [11:0] reading0, reading1, reading2, reading3, reading4, reading5, reading6, reading7;

parameter T_SCLK = 8'd4;
parameter NUM_CH = 4'd7;
parameter BOARD = "DE10-Standard";
parameter BOARD_REV = "Autodetect";
parameter MAX10_PLL_MULTIPLY_BY = 1;
parameter MAX10_PLL_DIVIDE_BY = 10;

generate

    if (BOARD == "DE10-Lite")
    begin
    
        parameter   resetState = 3'd0, idleState=3'd1, turnOnSequencerState=3'd2, pendingConversionState=3'd3, readConversionState=3'd4, doneConversionState=3'd5;
        reg [3:0]   channel;
        reg [2:0]   currState, nextState;
        wire        sample_store_irq; 
        wire [31:0] sample_store_readdata;
        reg         sample_store_read, sample_store_write;
        wire [31:0] sample_store_writedata;
        reg [6:0]   sample_store_address;
        reg         sequencer_write;
        wire [31:0] sequencer_writedata;
        reg         sequencer_on;
        wire        adc_pll_locked;
        wire        adc_pll_clk;
        
        // Constant outputs
        assign sequencer_writedata = 32'd1;
        assign sample_store_writedata = 32'd1;
        
        always @(*)begin
            {sclk, din, cs_n} <= 3'bzzz;
        end

        // PLL to generate the 10 MHz clock
        // MAX10_ADC_PLL adc_pll(clock, adc_pll_clk, adc_pll_locked);
        
        altpll	adc_pll (
				.inclk ({1'b0,clock}),
				.clk (adc_pll_clk),
				.locked (adc_pll_locked),
				.activeclock (),
				.areset (1'b0),
				.clkbad (),
				.clkena ({6{1'b1}}),
				.clkloss (),
				.clkswitch (1'b0),
				.configupdate (1'b0),
				.enable0 (),
				.enable1 (),
				.extclk (),
				.extclkena ({4{1'b1}}),
				.fbin (1'b1),
				.fbmimicbidir (),
				.fbout (),
				.fref (),
				.icdrclk (),
				.pfdena (1'b1),
				.phasecounterselect ({4{1'b1}}),
				.phasedone (),
				.phasestep (1'b1),
				.phaseupdown (1'b1),
				.pllena (1'b1),
				.scanaclr (1'b0),
				.scanclk (1'b0),
				.scanclkena (1'b1),
				.scandata (1'b0),
				.scandataout (),
				.scandone (),
				.scanread (1'b0),
				.scanwrite (1'b0),
				.sclkout0 (),
				.sclkout1 (),
				.vcooverrange (),
				.vcounderrange ());
        defparam
            adc_pll.bandwidth_type = "AUTO",
            adc_pll.clk0_divide_by = MAX10_PLL_DIVIDE_BY,
            adc_pll.clk0_duty_cycle = 50,
            adc_pll.clk0_multiply_by = MAX10_PLL_MULTIPLY_BY,
            adc_pll.clk0_phase_shift = "0",
            adc_pll.compensate_clock = "CLK0",
            adc_pll.inclk0_input_frequency = 10000,
            adc_pll.intended_device_family = "MAX 10",
            adc_pll.lpm_hint = "CBX_MODULE_PREFIX=MAX10_ADC_PLL",
            adc_pll.lpm_type = "altpll",
            adc_pll.operation_mode = "NORMAL",
            adc_pll.pll_type = "AUTO",
            adc_pll.port_activeclock = "PORT_UNUSED",
            adc_pll.port_areset = "PORT_UNUSED",
            adc_pll.port_clkbad0 = "PORT_UNUSED",
            adc_pll.port_clkbad1 = "PORT_UNUSED",
            adc_pll.port_clkloss = "PORT_UNUSED",
            adc_pll.port_clkswitch = "PORT_UNUSED",
            adc_pll.port_configupdate = "PORT_UNUSED",
            adc_pll.port_fbin = "PORT_UNUSED",
            adc_pll.port_inclk0 = "PORT_USED",
            adc_pll.port_inclk1 = "PORT_UNUSED",
            adc_pll.port_locked = "PORT_USED",
            adc_pll.port_pfdena = "PORT_UNUSED",
            adc_pll.port_phasecounterselect = "PORT_UNUSED",
            adc_pll.port_phasedone = "PORT_UNUSED",
            adc_pll.port_phasestep = "PORT_UNUSED",
            adc_pll.port_phaseupdown = "PORT_UNUSED",
            adc_pll.port_pllena = "PORT_UNUSED",
            adc_pll.port_scanaclr = "PORT_UNUSED",
            adc_pll.port_scanclk = "PORT_UNUSED",
            adc_pll.port_scanclkena = "PORT_UNUSED",
            adc_pll.port_scandata = "PORT_UNUSED",
            adc_pll.port_scandataout = "PORT_UNUSED",
            adc_pll.port_scandone = "PORT_UNUSED",
            adc_pll.port_scanread = "PORT_UNUSED",
            adc_pll.port_scanwrite = "PORT_UNUSED",
            adc_pll.port_clk0 = "PORT_USED",
            adc_pll.port_clk1 = "PORT_UNUSED",
            adc_pll.port_clk2 = "PORT_UNUSED",
            adc_pll.port_clk3 = "PORT_UNUSED",
            adc_pll.port_clk4 = "PORT_UNUSED",
            adc_pll.port_clk5 = "PORT_UNUSED",
            adc_pll.port_clkena0 = "PORT_UNUSED",
            adc_pll.port_clkena1 = "PORT_UNUSED",
            adc_pll.port_clkena2 = "PORT_UNUSED",
            adc_pll.port_clkena3 = "PORT_UNUSED",
            adc_pll.port_clkena4 = "PORT_UNUSED",
            adc_pll.port_clkena5 = "PORT_UNUSED",
            adc_pll.port_extclk0 = "PORT_UNUSED",
            adc_pll.port_extclk1 = "PORT_UNUSED",
            adc_pll.port_extclk2 = "PORT_UNUSED",
            adc_pll.port_extclk3 = "PORT_UNUSED",
            adc_pll.self_reset_on_loss_lock = "OFF",
            adc_pll.width_clock = 5;

        // The IP core that controls the MAX10's built-in ADC
        DE10_Lite_ADC_Core_modular_adc_0 max10_adc_core (
            .adc_pll_clock_clk(adc_pll_clk),
            .adc_pll_locked_export(adc_pll_locked),
            .clock_clk(clock),
            .reset_sink_reset_n(~reset),
            .sample_store_csr_address(sample_store_address),
            .sample_store_csr_read(sample_store_read),
            .sample_store_csr_write(sample_store_write),
            .sample_store_csr_writedata(sample_store_writedata),
            .sample_store_csr_readdata(sample_store_readdata),
            .sample_store_irq_irq(sample_store_irq),
            .sequencer_csr_address(1'd0),
            .sequencer_csr_read(1'b0),
            .sequencer_csr_write(sequencer_write),
            .sequencer_csr_writedata(sequencer_writedata), 
            .sequencer_csr_readdata());
        defparam
            max10_adc_core.num_ch = NUM_CH+1;
        
        always @(posedge clock)
            currState <= nextState;
        
        // - - - - -NextState Selection Logic - - - - - - - -
        always @(*)
        begin
            if (reset)
            begin
                                                    nextState = resetState;
            end
            else
                case (currState)
                    resetState:
                                                    nextState = idleState;
                    idleState:
                    begin
                        if (go && ~sequencer_on)    nextState = turnOnSequencerState;
                        else if (go)                nextState = pendingConversionState;
                        else                        nextState = idleState;
                    end
                    
                    turnOnSequencerState:
                    begin
                                                    nextState = pendingConversionState;
                    end
                    
                    pendingConversionState:
                    begin
                        if (sample_store_irq)       nextState = readConversionState;
                        else                        nextState = pendingConversionState;
                    end
                    
                    readConversionState:
                    begin
                        // Get the conversions from the sample store
                        if (channel <= NUM_CH)
                                                    nextState = readConversionState;
                        else
                                                    nextState = doneConversionState;
                    end
                    
                    doneConversionState:
                    begin
                                                    nextState = idleState;
                    end
                    
                    default:
                                                    nextState = resetState;
                endcase
        end
        
        // - - - - - Control Signals Logic - - - - - - - -
        always @(*)
        begin
            if (currState == turnOnSequencerState) sequencer_write <= 1'd1;
            else sequencer_write <= 1'd0;
        end
        
        always @(posedge clock)
        begin
            if (reset) sequencer_on <= 1'd0;
            else if (currState == turnOnSequencerState) sequencer_on <= 1'd1;
            else sequencer_on <= sequencer_on;
        end
        
        always @(posedge clock)
        begin
            if (currState == idleState || currState == resetState) channel <= 4'd0;
            else if (currState == readConversionState) channel <= channel + 4'd1;
            else channel <= channel;
        end
        
        always @(*)
        begin
            if (currState == readConversionState) sample_store_read <= 1'd1;
            else sample_store_read <= 1'd0;
        end
        
        always @(*)
        begin
            if (currState == doneConversionState) begin
                done <= 1'd1;
                // Clear the irq
                sample_store_write <= 1'd1;
            end
            else if (currState == turnOnSequencerState)
            begin
                done <= 1'd0;
                // Turn on the IRQs
                sample_store_write <= 1'd1;
            end
            else begin
                done <= 1'd0;
                sample_store_write <= 1'd0;
            end
        end
        
        always @(*)
        begin
            if (currState == readConversionState) sample_store_address <= {3'd0,channel};
            else if (currState == turnOnSequencerState) sample_store_address <= 7'h40;
            else sample_store_address <= 7'h41;
        end
        
        always @(posedge clock)
        begin
            reading0 = reading0;
            reading1 = reading1;
            reading2 = reading2;
            reading3 = reading3;
            reading4 = reading4;
            reading5 = reading5;
            reading6 = 12'd0;
            reading7 = 12'd0;
            
            if (currState == readConversionState || currState == doneConversionState)
            begin
                case (channel)
                    // Note: the sample store reads are 1 cycle delay
                    4'd2: reading0 = sample_store_readdata[11:0];
                    4'd3: reading1 = sample_store_readdata[11:0];
                    4'd4: reading2 = sample_store_readdata[11:0];
                    4'd5: reading3 = sample_store_readdata[11:0];
                    4'd6: reading4 = sample_store_readdata[11:0];
                    4'd7: reading5 = sample_store_readdata[11:0];
                endcase
            end
        end
        
    end
    else if (BOARD == "DE1-SoC" || BOARD == "DE0-Nano-SoC" || BOARD == "DE10-Nano" || BOARD == "DE10-Standard")
    begin
    
        //FSM state values
        parameter resetState = 3'd0, waitState=3'd1, transState=3'd2, doneState=3'd3, pauseState=3'd4, initCtrlRegState=3'd5, pauseStateNoAddrIncr=3'd6;

        reg [2:0] currState, nextState;
        reg [14:0] dout_shift_reg;
        reg [11:0] din_shift_reg;
        reg [7:0] counter;
        reg [12:0] pause_counter;
        reg [3:0] sclk_counter;
        reg [2:0] address, next_addr;
        reg [3:0] ad_or_ltc_error_count = 4'd0;
        wire isLTC;
        
        // if AD7928 chip, isLTC == 0. if LTC 2308 chip, isLTC == 1.
        if (BOARD == "DE1-SoC" && BOARD_REV == "Autodetect")
            assign isLTC = ad_or_ltc_error_count[3];
        else if (BOARD == "DE1-SoC" && BOARD_REV == "A - E")
            assign isLTC = 1'b0;
        else // DE0-Nano-SoC. DE1-SoC rev F+, DE10-Nano, DE10-Standard have the LTC chip
            assign isLTC = 1'b1;

        wire transStateComplete = ((isLTC && sclk_counter==4'd11) || sclk_counter==4'd15) && counter==0;

        always @(posedge clock)
            currState <=nextState;
            
        // - - - - -NextState Selection Logic - - - - - - - -
            always @(*)
            begin
                din = din_shift_reg[11];
                if (reset)
                    nextState=resetState;
                case (currState)
                    resetState:begin
                        cs_n=1;
                        done=0;
                        /*if (isLTC)
                            nextState=waitState;
                        else*/
                            nextState=initCtrlRegState;
                    end
                    initCtrlRegState:begin
                        cs_n=0;
                        done=0;
                        if (transStateComplete && !sclk)
                            if (isLTC)
                                nextState = pauseStateNoAddrIncr;
                            else
                                nextState = waitState;
                        else
                            nextState=initCtrlRegState;
                    end
                    pauseStateNoAddrIncr:begin
                        cs_n=1;
                        done=0;
                        if (pause_counter > 13'd0)
                            nextState=pauseStateNoAddrIncr;
                        else
                            nextState=transState;
                    end
                    waitState:begin
                        cs_n=1;
                        done=0;
                        if (go)
                            nextState=transState;
                        else
                            nextState=waitState;
                    end
                    transState:begin
                        cs_n=0;
                        done=0;
                        if (transStateComplete && !sclk)
                            nextState=pauseState;
                        else
                            nextState=transState;
                    end
                    // pause state must be >= 50ns! This is the "tquiet" required between conversions (or tCONV = 1.6us for LTC)
                    pauseState:begin
                        cs_n=1;
                        done=0;
                        if (pause_counter > 13'd0)
                            nextState=pauseState;
                        else if(address==NUM_CH[2:0])
                            nextState=doneState;
                        else
                            nextState=transState;
                    end
                    doneState:begin
                        cs_n=1;
                        done=1;
                        if (go)
                            nextState=doneState;
                        else
                            nextState=resetState;
                    end
                    default:begin
                        cs_n=1;
                        done=0;
                        nextState = resetState;
                    end
                endcase
            end
        // - - - - - - - - - pause counter logic - - - - - - - - - - 
            always @(posedge clock)
            if (currState == pauseState || currState == pauseStateNoAddrIncr)
                pause_counter <= pause_counter - 13'd1;
            else 
                // T_SCLK is such that T_SCLK cycles of clock -> 20MHz or less SCLK.
                if (isLTC)
                    pause_counter <= {T_SCLK[7:0],5'd0};
                else
                    pause_counter <= {5'd0,T_SCLK[7:1],(T_SCLK[0]&&sclk)}-8'd1;
        // - - - - - - - - - counter logic - - - - - - - - - - 
            always @(posedge clock or posedge reset)
            if (reset)
                counter <= T_SCLK[7:1]+(T_SCLK[0]&&sclk)-8'd1;
            else if (cs_n)
                counter <= T_SCLK[7:1]+(T_SCLK[0]&&sclk)-8'd1;
            else if (counter == 0)
                counter <= T_SCLK[7:1]+(T_SCLK[0]&&sclk)-8'd1;
            else
                counter <= counter - 8'b1;
        // - - - - - - - - ADC_SCLK generation - - - - - - - - - 
            always @(posedge clock or posedge reset)
            if (reset)
                sclk <= ~isLTC;
            else if (cs_n)
                sclk <= ~isLTC;
            else if (counter == 0)
                sclk <= ~sclk;
        // - - - - - - - - - - - sclk_counter logic - - - - - - - -
            always @ (posedge clock)
                if (reset || currState == doneState || currState == pauseState || currState == pauseStateNoAddrIncr || currState == waitState || currState == resetState)
                    sclk_counter <=4'b0;
                else if (counter == 0 && !sclk)
                    sclk_counter <= sclk_counter + 4'b1;
        // - - - - - - - - - - readings logic - - - - - - - - - -
            always @(posedge clock)
                if (reset)
                begin
                    reading0 <= 12'd0;
                    //ad_or_ltc <= 1'b0;
                    ad_or_ltc_error_count <= 4'd0;
                end
                else if (transStateComplete && sclk)
                begin
                    if (!isLTC && dout_shift_reg[13:11] == address)
                        case (dout_shift_reg[13:11])
                            3'd0: reading0 <= {dout_shift_reg[10:0],dout}; // should be {dout_shift_reg[10:0],dout}
                            3'd1: reading1 <= {dout_shift_reg[10:0],dout};
                            3'd2: reading2 <= {dout_shift_reg[10:0],dout};
                            3'd3: reading3 <= {dout_shift_reg[10:0],dout};
                            3'd4: reading4 <= {dout_shift_reg[10:0],dout};
                            3'd5: reading5 <= {dout_shift_reg[10:0],dout};
                            3'd6: reading6 <= {dout_shift_reg[10:0],dout};
                            3'd7: reading7 <= {dout_shift_reg[10:0],dout};
                        endcase
                    else if (isLTC)
                        case (address)
                            3'd0: begin
                                if (NUM_CH[2:0] == 3'd0)
                                    reading0 <= {dout_shift_reg[10:0],dout};
                                else if (NUM_CH[2:0] == 3'd1)
                                    reading1 <= {dout_shift_reg[10:0],dout};
                                else if (NUM_CH[2:0] == 3'd2)
                                    reading2 <= {dout_shift_reg[10:0],dout};
                                else if (NUM_CH[2:0] == 3'd3)
                                    reading3 <= {dout_shift_reg[10:0],dout};
                                else if (NUM_CH[2:0] == 3'd4)
                                    reading4 <= {dout_shift_reg[10:0],dout};
                                else if (NUM_CH[2:0] == 3'd5)
                                    reading5 <= {dout_shift_reg[10:0],dout};
                                else if (NUM_CH[2:0] == 3'd6)
                                    reading6 <= {dout_shift_reg[10:0],dout};
                                else if (NUM_CH[2:0] == 3'd7)
                                    reading7 <= {dout_shift_reg[10:0],dout};
                            end
                            3'd1: reading0 <= {dout_shift_reg[10:0],dout};
                            3'd2: reading1 <= {dout_shift_reg[10:0],dout};
                            3'd3: reading2 <= {dout_shift_reg[10:0],dout};
                            3'd4: reading3 <= {dout_shift_reg[10:0],dout};
                            3'd5: reading4 <= {dout_shift_reg[10:0],dout};
                            3'd6: reading5 <= {dout_shift_reg[10:0],dout};
                            3'd7: reading6 <= {dout_shift_reg[10:0],dout};
                        endcase

                    else if (ad_or_ltc_error_count < 4'd15 && currState == transState)
                        ad_or_ltc_error_count <= ad_or_ltc_error_count + 4'd1;
                        //ad_or_ltc <= 1'b1;
                end
        // - - - - - - - - - address logic - - - - - - - - -
            always @(posedge clock)
                if (reset || currState == waitState || (currState == resetState && isLTC))
                    address <= 3'd0;
                else if (currState == pauseState && pause_counter == 13'd0)
                    if (address < NUM_CH[2:0])
                        address <= next_addr;
                    /*if (address >= NUM_CH[2:0])
                        address <= 3'd0;
                    else
                        address <= next_addr;*/
        // - - - - - - - - - - dout_shift_reg logic - - - - - - - - - - - - 
            always @(posedge clock)
                if (reset)
                    dout_shift_reg <= 15'd0;
                else if (counter==0 && ~isLTC == sclk && (!isLTC || sclk_counter != 4'd11) && sclk_counter != 4'd15)
                    dout_shift_reg [14:0] <= {dout_shift_reg [13:0], dout};
        // - - - - - - - - - - din_shift_reg logic - - - - - - - - -
            always @(posedge clock)
                if (currState == resetState)
                    if (isLTC)
                        din_shift_reg <= {1'b1,NUM_CH[0],NUM_CH[2],NUM_CH[1],2'b10,6'd0};// S/D, O/S, S1, S0, UNI, SLP
                    else
                        din_shift_reg <= {3'b110,NUM_CH[2:0],6'b111001};     //13'hDF9; // Ctrl reg initialize to 0xdf90. MSB is a dummy value that doesnt actually get used
                else if ((currState == waitState && go) || currState == pauseStateNoAddrIncr ||
                            (currState == pauseState && address != NUM_CH[2:0]) ||
                            (isLTC && currState == transState && counter != 0 &&  sclk_counter == 4'd0)) // For LTC, grab immediately after transition to transState
                    if (isLTC)
                        din_shift_reg <= {1'b1,address[0],address[2],address[1],2'b10,6'd0};// S/D, O/S, S1, S0, UNI, SLP
                    else
                        din_shift_reg <= {3'b010,NUM_CH[2:0],6'b111001};     //13'h5DF9  WRITE=0,SEQ=1,DONTCARE,ADDR2,ADDR1,ADDR0,DONTCARE*6
                else if (counter == 8'd0 && isLTC == sclk)
                    din_shift_reg <={din_shift_reg[10:0],1'b0};
        // - - - - - - - - - - next_addr logic - - - - - - - - - - - -
            always @(posedge clock)
                if (reset)
                    next_addr <= 3'd0;
                else
                    next_addr <= address + 3'b1;
	end
    else if (BOARD == "DE0-Nano")
    begin
        //FSM state values
        parameter resetState = 3'd0, waitState=3'd1, transState=3'd2, doneState=3'd3, pauseState=3'd4;

        reg [2:0] currState, nextState;
        reg [10:0] shift_reg;
        reg [5:0] addr_shift_reg;
        reg [7:0] counter;
        reg [3:0] sclk_counter;
        reg [2:0] address, next_addr;

        always @(posedge clock)
            currState <=nextState;
            
        // - - - - -NextState Selection Logic - - - - - - - -
            always @(*)
            begin
                din = addr_shift_reg[5];
                if (reset)
                    nextState=resetState;
                case (currState)
                    resetState:begin
                        cs_n=1;
                        done=0;
                        nextState=waitState;
                    end
                    waitState:begin
                        cs_n=1;
                        done=0;
                        if (go)
                            nextState=transState;
                        else
                            nextState=waitState;
                    end
                    transState:begin
                        cs_n=0;
                        done=0;
                        if (sclk_counter==4'd15&& counter==0 && !sclk)
                            nextState=pauseState;
                        else
                            nextState=transState;
                    end
                    pauseState:begin
                        cs_n=0;
                        done=0;
                        if(address==3'd0)
                            nextState=doneState;
                        else
                            nextState=transState;
                    end
                    doneState:begin
                        cs_n=1;
                        done=1;
                        if (go)
                            nextState=doneState;
                        else
                            nextState=waitState;
                    end
                    default:begin
                        cs_n=1;
                        done=0;
                        nextState = resetState;
                    end
                endcase
            end
        // - - - - - - - - - counter logic - - - - - - - - - - 
            always @(posedge clock or posedge reset)
            if (reset)
                counter <= T_SCLK[7:1]+(T_SCLK[0]&&sclk)-8'd1;
            else if (cs_n)
                counter <= T_SCLK[7:1]+(T_SCLK[0]&&sclk)-8'd1;
            else if (counter == 0)
                counter <= T_SCLK[7:1]+(T_SCLK[0]&&sclk)-8'd1;
            else
                counter <= counter - 8'b1;
        // - - - - - - - - ADC_SCLK generation - - - - - - - - - 
            always @(posedge clock or posedge reset)
            if (reset)
                sclk <= 1;
            else if (cs_n)
                sclk <= 1;
            else if (counter == 0)
                sclk <= ~sclk;
        // - - - - - - - - - - - sclk_counter logic - - - - - - - -
            always @ (posedge clock)
                if (currState == doneState || currState == waitState)
                    sclk_counter <=4'b0;
                else if (counter == 0 && !sclk)
                    sclk_counter <= sclk_counter + 4'b1;
        // - - - - - - - - - - readings logic - - - - - - - - - -
            always @(posedge clock)
                if (sclk_counter == 4'd15 && counter == 0 && !sclk)
                    if (address == 0)
                        case (NUM_CH)
                            4'd2: reading1 <= {shift_reg[10:0],dout};
                            4'd3: reading2 <= {shift_reg[10:0],dout};
                            4'd4: reading3 <= {shift_reg[10:0],dout};
                            4'd5: reading4 <= {shift_reg[10:0],dout};
                            4'd6: reading5 <= {shift_reg[10:0],dout};
                            4'd7: reading6 <= {shift_reg[10:0],dout};
                            4'd8: reading7 <= {shift_reg[10:0],dout};
                        endcase
                    else 
                        case (address)
                            3'd1: reading0 <= {shift_reg[10:0],dout};
                            3'd2: reading1 <= {shift_reg[10:0],dout};
                            3'd3: reading2 <= {shift_reg[10:0],dout};
                            3'd4: reading3 <= {shift_reg[10:0],dout};
                            3'd5: reading4 <= {shift_reg[10:0],dout};
                            3'd6: reading5 <= {shift_reg[10:0],dout};
                            3'd7: reading6 <= {shift_reg[10:0],dout};
                        endcase
        // - - - - - - - - - address logic - - - - - - - - -
            always @(posedge clock)
                if (currState == resetState)
                    address <= 3'd1;
                else if (currState == pauseState)
                    if (address >= (NUM_CH-1))
                        address <= 3'd0;
                    else
                        address <= next_addr;
        // - - - - - - - - - - shift_reg logic - - - - - - - - - - - - 
            always @(posedge clock)
                if (counter==0 && !sclk && sclk_counter != 4'd15)
                    shift_reg [10:0] <= {shift_reg [9:0], dout};
        // - - - - - - - - - - addr_shift_reg logic - - - - - - - - -
            always @(posedge clock)
                if (currState == waitState && go)
                    addr_shift_reg <= 6'b000001;
                else if (currState == pauseState)
                    if (address >= (NUM_CH-1))
                        addr_shift_reg <= 6'b0;
                    else
                        addr_shift_reg <= {3'b0, next_addr};
                else if (counter==0 && sclk)
                    addr_shift_reg <={addr_shift_reg[4:0],1'b0};
        // - - - - - - - - - - next_addr logic - - - - - - - - - - - -
            always @(posedge clock)
                next_addr <= address + 3'b1;
    end
    
endgenerate
        
endmodule 
