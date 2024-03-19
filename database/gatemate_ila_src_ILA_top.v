/*
#################################################################################################
#    << CologneChip GateMate ILA - Top-Level >>                                                 #
#    Setup ILA, integration of SUT and controls communication                                   #
# ********************************************************************************************* #
#    Copyright (C) 2023 Cologne Chip AG <support@colognechip.com>                               #
#    Developed by Dave Fohrn                                                                    #
#                                                                                               #
#    This program is free software: you can redistribute it and/or modify                       #
#    it under the terms of the GNU General Public License as published by                       #
#    the Free Software Foundation, either version 3 of the License, or                          #
#    (at your option) any later version.                                                        #
#                                                                                               #
#    This program is distributed in the hope that it will be useful,                            #
#    but WITHOUT ANY WARRANTY; without even the implied warranty of                             #
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the                              #
#    GNU General Public License for more details.                                               #
#                                                                                               #
#    You should have received a copy of the GNU General Public License                          #
#    along with this program.  If not, see <https://www.gnu.org/licenses/>.                     #
#                                                                                               #
# ********************************************************************************************* #
#################################################################################################
*/

module ila_top#(
    parameter SIGNAL_SYNCHRONISATION = 0,
    parameter USE_USR_RESET = 1, 
    parameter USE_PLL = 0,
    parameter USE_FEATURE_PATTERN = 1,
    parameter samples_count_before_trigger = 2048,
    parameter bits_samples_count_before_trigger = 10,
    parameter bits_samples_count = 12,
    parameter sample_width = 100,
    parameter external_clk_freq = "10.0",
    parameter sampling_freq_MHz = "100.0",
    parameter BRAM_matrix_wide = 20,
    parameter BRAM_matrix_deep = 1,
    parameter BRAM_single_wide = 5,
    parameter BRAM_single_deep = 13,
    parameter clk_delay = 2
)(
    (* clkbuf_inhibit *) input i_sclk_ILA,
    input i_mosi_ILA,
    output o_miso_ILA,
// #################################################################################################
// # ********************************************************************************************* #
// __Place~for~Signals~start__
input clk,
output [3:0] led,
// __Place~for~Signals~ends__
// #################################################################################################
    // test Signals,
    //  input rst,
    // output [7:0] led,
    // test Signals ends
    input i_ss_ILA
    );

wire [(sample_width-1):0] sample;
wire clk0_2;
wire USR_RSTN;
reg hold_reset;
wire reset_DUT;
wire ILA_clk_src;
// #################################################################################################
// # ********************************************************************************************* #
// __Place~for~SUT~start__
blink_4 DUT (.ILA_rst(reset_DUT), .ila_clk_src(ILA_clk_src), .clk(clk), .led(led), .ila_sample_dut(sample));
// __Place~for~SUT~ends__
// #################################################################################################
//blink DUT ( .clk(i_clk), .rst(rst), .led(led), .ila_sample_dut(sample));
// cc PLL instance
wire clk270, clk180, clk90, clk0, i_clk_ILA, usr_ref_out_1;
wire usr_pll_lock_stdy_1, usr_pll_lock_1;
generate
    if (USE_PLL == 1) begin
        CC_PLL #(
        		.REF_CLK(external_clk_freq),    // reference input in MHz
        		.OUT_CLK(sampling_freq_MHz),   // pll output frequency in MHz
        		.PERF_MD("SPEED"), // LOWPOWER, ECONOMY, SPEED
        		.LOW_JITTER(1),      // 0: disable, 1: enable low jitter mode
        		.CI_FILTER_CONST(2), // optional CI filter constant
        		.CP_FILTER_CONST(4)  // optional CP filter constant
        	) pll_inst_ila (
        		.CLK_REF(ILA_clk_src), .CLK_FEEDBACK(1'b0), .USR_CLK_REF(1'b0),
        		.USR_LOCKED_STDY_RST(1'b0), .USR_PLL_LOCKED_STDY(usr_pll_lock_stdy_1), .USR_PLL_LOCKED(usr_pll_lock_1),
        		.CLK270(clk270), .CLK180(clk180), .CLK90(clk90), .CLK0(clk0), .CLK_REF_OUT(usr_ref_out_1)
        	);
            if (clk_delay == 0) begin
                assign i_clk_ILA = clk0;
            end
            else if (clk_delay == 1) begin
                assign i_clk_ILA = clk90;
            end
            else if (clk_delay == 2) begin
                assign i_clk_ILA = clk180;
            end
            else begin
                assign i_clk_ILA = clk270;
            end
        end else begin
            assign i_clk_ILA = ILA_clk_src;
        end
endgenerate



CC_USR_RSTN usr_rstn_inst (
   .USR_RSTN(USR_RSTN) // reset signal to CPE array
);








// Communication of the ILA

// SPI-Slave

wire [7:0] spi_byte_send, spi_byte_receive;
wire config_ILA;
wire s_s_rec_byte_ready;
wire spi_echo;
spi_slave spi_passiv (.i_sclk(i_sclk_ILA), 
                .i_ss(i_ss_ILA), 
                .i_echo(spi_echo), 
                .i_mosi(i_mosi_ILA), 
                .o_miso(o_miso_ILA), 
                .i_byte_send(spi_byte_send), 
                .o_byte_rec(spi_byte_receive), 
                .o_rec_byte_ready(s_s_rec_byte_ready));

reg ila_reset_register;                                     // Register to reset the ILA from SPI

// Processing of the received commands

wire change_trigger_hold, change_trigger_activation_hold;
reg ready_read;


always @(posedge i_clk_ILA) begin
    if (!ila_reset_register) begin
        ready_read <= 0;
    end else if (!config_ILA) begin
        ready_read <= 1;
    end else
    ready_read <= 0;
end

// Processing SPI command: ILA reset

wire ila_reset_signal;
receive_command #(.ADDR(8'b00101010)) ila_reset (.i_clk(i_sclk_ILA), .i_reset(USR_RSTN), .i_ready_read(ready_read), .i_Byte(spi_byte_receive),
.i_done(!ila_reset_register), .o_hold(ila_reset_signal));

always @(posedge i_sclk_ILA) begin
    if (ila_reset_signal) begin
        ila_reset_register <= 0;
    end else begin
        ila_reset_register <= USR_RSTN;
    end
end


wire dut_reset_signal;
wire trigger_active_hold;
reg hold_done;

generate
    if (USE_USR_RESET == 1) begin
            
        receive_command #(.ADDR(8'b10101111)) dut_reset (.i_clk(i_sclk_ILA), .i_reset(ila_reset_register), .i_ready_read(ready_read), .i_Byte(spi_byte_receive),
        .i_done(hold_done), .o_hold(dut_reset_signal));

        always @(posedge i_sclk_ILA) begin
            if (!ila_reset_register) begin
                hold_done <= 0;
            end else if (dut_reset_signal & s_s_rec_byte_ready) begin
                hold_done <= 1;
            end
            else begin
                hold_done <= 0;
            end
        end

        always @(posedge i_sclk_ILA) begin
            if (!ila_reset_register | trigger_active_hold) begin
                hold_reset <= 1;
            end else if (hold_done) begin
                hold_reset <= !hold_reset;
            end 
        end

        assign reset_DUT = (!USR_RSTN) ? 0 : hold_reset;
        end
endgenerate
// Processing SPI command: set Trigger Signal

reg [5:0] trigger_column;
reg [5:0] trigger_row;

reg  change_trigger_done;

wire [3:0] data_first_trigger;

rec_cmd_nib #(.ADDR(4'b1001)) change_trigger (.i_clk(i_sclk_ILA), .i_reset(ila_reset_register), .i_ready_read(ready_read), .i_Byte(spi_byte_receive),
.i_done(change_trigger_done), .o_hold(change_trigger_hold), .o_data(data_first_trigger));


always @(posedge i_sclk_ILA) begin
    if (!ila_reset_register) begin
        trigger_column <= 0;
        trigger_row <= 0;
        change_trigger_done <= 0;
    end
    else if (change_trigger_hold & s_s_rec_byte_ready) begin // arbeite am timing der kommunikation hier
        trigger_row <= {data_first_trigger, spi_byte_receive[7:6]};
        trigger_column <= spi_byte_receive[5:0];
        change_trigger_done <= 1;
    end else if (!change_trigger_hold & s_s_rec_byte_ready)begin
        change_trigger_done <= 0;
    end
end

// Processing SPI command: Change trigger activation

reg change_trigger_activation_done;

reg [1:0] trigger_activation;
wire [3:0] data_first;

rec_cmd_nib #(.ADDR(4'b0011)) change_trigger_activation(.i_clk(i_sclk_ILA), .i_reset(ila_reset_register), .i_ready_read(ready_read), .i_Byte(spi_byte_receive),
                               .i_done(change_trigger_activation_done), .o_hold(change_trigger_activation_hold), .o_data(data_first));

always @(posedge i_sclk_ILA) begin
    if (!ila_reset_register) begin
        trigger_activation <= 0;
        change_trigger_activation_done <= 0;
    end
    else if (change_trigger_activation_hold) begin
        trigger_activation <= data_first[1:0];
        change_trigger_activation_done <= 1;
    end
    else begin
        change_trigger_activation_done <= 0;
    end
end

// Processing SPI command: Activate trigger

receive_command_hold #(.ADDR(8'b01010101)) trigger_active (.i_clk(i_sclk_ILA), .i_reset(ila_reset_register), .i_ready_read(ready_read), .i_Byte(spi_byte_receive),
 .o_hold(trigger_active_hold));


// Processing SPI command: Starting the reading of the stored samples

wire ready_read_ram;
wire read_active;    
receive_command_hold #(.ADDR(8'b10101010)) command_read (.i_clk(i_sclk_ILA), .i_reset(ila_reset_register), .i_ready_read(ready_read_ram), .i_Byte(spi_byte_receive),
 .o_hold(read_active));
 
// Trigger detection

wire [(BRAM_single_wide-1):0] trigger_pipe_out;
reg [(BRAM_single_wide-1):0] trigger_pipe;

reg trigger;

always @(posedge i_clk_ILA) begin
    trigger <= trigger_pipe[trigger_column]; 
end

wire trigger_post_edge, trigger_nedge_edge;
edge_detection trigger_edge (.i_clk(i_clk_ILA), .i_reset(ila_reset_register), .i_signal(trigger), .o_post_edge(trigger_post_edge), .o_nedge_edge(trigger_nedge_edge));

wire trigger_detect;

// pattern compare

generate
    if (USE_FEATURE_PATTERN == 1) begin
        localparam nibble_sample = ((sample_width-1)/4)+1;
        reg [(sample_width-1):0] sample_source;
        reg trigger_detect_pattern_arrived;
        reg trigger_detect_pattern_arrived_pipe;
        reg sample_pattern_arrived; 
        reg change_pattern_done;
        wire change_pattern_hold;
        receive_command #(
            .ADDR(8'b11001100)
            ) change_pattern (
                .i_clk(i_sclk_ILA), 
                .i_reset(ila_reset_register), 
                .i_ready_read(ready_read), 
                .i_Byte(spi_byte_receive),
                .i_done(change_pattern_done), 
                .o_hold(change_pattern_hold));

        reg [(nibble_sample*4)-1:0] bit_pattern_fit, bit_mask_fit; 


        if (sample_width < 5) begin
            always @(posedge i_sclk_ILA) begin
                if (!ila_reset_register) begin
                    bit_pattern_fit <= 0;
                    bit_mask_fit <= 0;
                    change_pattern_done <= 0;
                end
                if (change_pattern_hold & s_s_rec_byte_ready) begin
                    bit_pattern_fit <= spi_byte_receive[3:0];
                    bit_mask_fit <=  spi_byte_receive[7:4];
                    change_pattern_done <= 1;
                end else if (!change_pattern_hold & s_s_rec_byte_ready) begin
                    change_pattern_done <= 0;
                end
            end
        end
        else begin
            localparam pattern_bit_count = $clog2(nibble_sample); 
            reg [pattern_bit_count:0] counter_rec_pattern_byte;
            reg [3:0] bit_pattern, bit_mask; 
            reg set_mask;

            always @(posedge i_sclk_ILA) begin
                if (!ila_reset_register) begin
                    set_mask <= 0;
                    bit_pattern <= 0;
                    bit_mask <= 0;
                end
                if (change_pattern_hold & s_s_rec_byte_ready) begin
                    bit_pattern <= spi_byte_receive[3:0];
                    bit_mask <=  spi_byte_receive[7:4];
                    set_mask <= 1;
                
                end else begin
                    set_mask <= 0;
                end
            end

            always @(posedge i_sclk_ILA) begin
                if (!ila_reset_register) begin
                    bit_pattern_fit <= 0;
                    bit_mask_fit <= 0;
                end
                else if(set_mask) begin
                    bit_pattern_fit <= {bit_pattern_fit[(nibble_sample*4)-5:0], bit_pattern};
                    bit_mask_fit <= {bit_mask_fit[(nibble_sample*4)-5:0], bit_mask};
                end
            end
            always @(posedge i_sclk_ILA) begin
                if (!ila_reset_register | (!change_pattern_hold & s_s_rec_byte_ready) ) begin
                    counter_rec_pattern_byte <= 0;
                    change_pattern_done <= 0;
                    end
                else if(set_mask) begin
                    counter_rec_pattern_byte <= counter_rec_pattern_byte+1;
                    end
                else if(counter_rec_pattern_byte == nibble_sample) begin
                    change_pattern_done <= 1;
                	end
            end
        end

        genvar i;
        localparam pipes = ((sample_width+1)/2);
        localparam pipes_from_pipes = ((pipes+5)/6);
        localparam add_pipe = ((pipes_from_pipes) % 2);
        reg [(pipes_from_pipes+add_pipe-1):0] pattern_match_stage_3;
        reg [(pipes_from_pipes+add_pipe-1):0] pattern_match_stage_3_control = ~0;

        if (add_pipe == 1) begin
            
            always @(posedge i_clk_ILA) begin
                if (!ila_reset_register) begin
                    pattern_match_stage_3[pipes_from_pipes] <= 1;
                end
            end 
        end
        reg [((pipes_from_pipes*6)-1):0] pattern_match_stage_1_1, pattern_match_stage_1_2, pattern_match_stage_2;
        reg [1:0] pattern_match_stage_4;
        reg [(pipes*2)-1:0] sample_target_fit;
        if ((sample_width % 2) == 1) begin
            always @(posedge i_clk_ILA) begin
                if (!ila_reset_register) begin
                    sample_target_fit <= 0;
                end
                else begin
                    sample_target_fit <= {1'b0, sample};
                end
            end
        end
        else begin
            always @(posedge i_clk_ILA) begin
                if (!ila_reset_register) begin
                    sample_target_fit <= 0;
                end
                else begin
                    sample_target_fit <= sample;
                end
            end
        end
        for (i = 0; i < (pipes*2); i = i+2) begin : loop
            always @(posedge i_clk_ILA) begin
                if (!ila_reset_register) begin
                    pattern_match_stage_1_1[i/2] <= 0;
                end
                else begin
                    pattern_match_stage_1_1[i/2] <= (bit_mask_fit[i] | (sample_target_fit[i] == bit_pattern_fit[i]));
                end
            end
            always @(posedge i_clk_ILA) begin
                if (!ila_reset_register) begin
                    pattern_match_stage_1_2[i/2] <= 0;
                end
                else begin
                    pattern_match_stage_1_2[i/2] <= ((bit_mask_fit[i+1] | (sample_target_fit[i+1] == bit_pattern_fit[i+1])));
                end
            end
            always @(posedge i_clk_ILA) begin
                if (!ila_reset_register) begin
                    pattern_match_stage_2[i/2] <= 0;
                end
                else begin
                    pattern_match_stage_2[i/2] <= (pattern_match_stage_1_1[i/2] & pattern_match_stage_1_2[i/2]);
                end
            end
        end
        if ((pipes_from_pipes*6) > pipes) begin
            always @(posedge i_clk_ILA) begin
                if (!ila_reset_register) begin
                    pattern_match_stage_2[((pipes_from_pipes*6)-1):pipes] <= ~0;
                    pattern_match_stage_1_1[((pipes_from_pipes*6)-1):pipes] <= ~0;
                    pattern_match_stage_1_2[((pipes_from_pipes*6)-1):pipes] <= ~0;
                end
            end 
        end
        for (i = 0; i < pipes_from_pipes; i = i+1) begin : loop2
            always @(posedge i_clk_ILA) begin
                if (!ila_reset_register) begin
                    pattern_match_stage_3[i] <= 0;
                end
                else if (pattern_match_stage_2[((6*(i+1))-1):6*i] == 6'b111111) begin
                    pattern_match_stage_3[i] <= 1;
                end else begin
                    pattern_match_stage_3[i] <= 0;
                end
            end
        end
        for (i = 0; i < 2; i = i+1) begin : loop3
            always @(posedge i_clk_ILA) begin
                if (!ila_reset_register) begin
                    pattern_match_stage_4[i] <= 0;
                end
                else if (pattern_match_stage_3[((((pipes_from_pipes+add_pipe)/2)*(1+i))-1):(((pipes_from_pipes+add_pipe)/2)*i)] == pattern_match_stage_3_control[((((pipes_from_pipes+add_pipe)/2)*(1+i))-1):(((pipes_from_pipes+add_pipe)/2)*i)]) begin
                    pattern_match_stage_4[i] <= 1;
                end else begin
                    pattern_match_stage_4[i] <= 0;
                end
            end
        end

        always @(posedge i_clk_ILA) begin
            if (!ila_reset_register) begin
                trigger_detect_pattern_arrived <= 0;
                trigger_detect_pattern_arrived_pipe <= 0;
            end
            else if (pattern_match_stage_4 == 2'b11) begin
                trigger_detect_pattern_arrived_pipe <= 1;
                trigger_detect_pattern_arrived <= trigger_detect_pattern_arrived_pipe;
            end
            else begin
                trigger_detect_pattern_arrived_pipe <= 0;
                trigger_detect_pattern_arrived <= trigger_detect_pattern_arrived_pipe;
            end
        end
        assign config_ILA = change_trigger_activation_hold | change_trigger_hold | change_pattern_hold;
        assign trigger_detect = (trigger_activation == 2'b01) ? trigger_post_edge : ((trigger_activation == 2'b00) ? trigger_nedge_edge : trigger_detect_pattern_arrived);
    end
    else begin
        assign config_ILA = change_trigger_activation_hold | change_trigger_hold;
        assign trigger_detect = (trigger_activation == 2'b01) ? trigger_post_edge :  trigger_nedge_edge;
    end

endgenerate

reg trigger_detect_reg;

always @(posedge i_clk_ILA) begin
    if (!ila_reset_register) begin
        trigger_detect_reg <= 0;
    end
    else if(trigger_detect) begin
        trigger_detect_reg <= 1;
    end
    else begin
        trigger_detect_reg <= 0;
    end
end



// Trigger detection

reg trigger_triggered;

always @(posedge i_clk_ILA) begin
    if (!ila_reset_register) begin
        trigger_triggered <= 0;
    end
    else if (trigger_active_hold & !trigger_triggered) begin 
        trigger_triggered <= trigger_detect_reg;
    end
end

assign ready_read_ram = trigger_triggered & s_s_rec_byte_ready; 

             
// memory management

wire [7:0] spi_data_send;

wire write_done;

always @(posedge i_clk_ILA) begin
    if (!ila_reset_register) begin
        trigger_pipe <= 0;
    end
    else begin 
        trigger_pipe <= trigger_pipe_out;
    end
end

bram_control #(.samples_count_before_trigger(samples_count_before_trigger), 
            .bits_samples_count_before_trigger(bits_samples_count_before_trigger),
            .bits_samples_count(bits_samples_count),
            .sample_width(sample_width),
            .BRAM_matrix_wide(BRAM_matrix_wide),
            .BRAM_matrix_deep(BRAM_matrix_deep),
            .BRAM_single_wide(BRAM_single_wide),
            .BRAM_single_deep(BRAM_single_deep),
            .SIGNAL_SYNCHRONISATION(SIGNAL_SYNCHRONISATION)) mem_control (.i_clk_ILA(i_clk_ILA), 
            .i_sclk(i_sclk_ILA),
            .i_reset(trigger_active_hold),
            .i_read_active(read_active),  
            .i_sample(sample), 
            .i_slave_end_byte_post_edge(s_s_rec_byte_ready), 
            .i_trigger_triggered(trigger_triggered), 
            .o_send_byte(spi_data_send),
            .o_write_done(write_done),
            .trigger_row(trigger_row),
            .trigger_out(trigger_pipe_out));


assign spi_echo = (!trigger_triggered & !read_active);

assign spi_byte_send = read_active ? spi_data_send : (write_done ? 8'b10101010 : 8'b00000000);

endmodule