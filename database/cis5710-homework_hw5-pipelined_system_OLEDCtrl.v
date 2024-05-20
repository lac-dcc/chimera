// This program was cloned from: https://github.com/cis5710/cis5710-homework
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Digilent Inc.
// Engineer: Arthur Brown
// 
// Create Date: 10/1/2016
// Module Name: OLEDCtrl
// Project Name: OLED Demo
// Target Devices: Nexys Video
// Tool Versions: Vivado 2016.2
// Description: Operates an OLED display using SPI protocol. Handles board initialization, display updates from local memory, full display commands.
// 
// Dependencies: SpiCtrl.v, Delay.v, block_rom.v, block_ram.v
//
// Revision 0.01 - File Created
//
//////////////////////////////////////////////////////////////////////////////////


module OLEDCtrl (
	input wire       clk,
	
	//Write command pins, when write_start asserted high, load pixel data for ascii character into local memory at address.
	//When ready to use / operation completed, assert write_ready high - start ignored when display off or machine is otherwise busy.
	input wire       write_start, //inserts an ascii character's bitmap into display memory at specified address
	input wire [7:0] write_ascii_data, //ascii value of character to add to memory
	input wire [8:0] write_base_addr, //on screen address of character to add {y[1:0], x[3:0], 3'b0}
	output wire      write_ready, //end of character bitmap write sequence
	
	//Update command pins, when update_start asserted high, send pixel data contents of local memory - or zeroes if update_clear asserted - to OLED over SPI.
	//When ready to use / operation completed, assert update_ready high - start ignored when display off or machine is otherwise busy.
	input wire       update_start, //updates oled display with memory contents
        input wire       update_clear,
	output wire      update_ready, //end of update sequence flag
	
	//Display On command pins, when disp_on_start asserted high, do initialization sequence as per spec.
	//When ready to use / operation completed, assert disp_on_ready high - start ignored when display is already on.
	input wire       disp_on_start, //starts initialization sequence
	output wire      disp_on_ready, //end of startup sequence flag
	
	//Display Off command pins, when disp_off_start asserted high, do safe shutdown sequence as per spec.
	//When ready to use / operation completed, assert update_ready high - start ignored when display off or machine is otherwise busy.
	input wire       disp_off_start, //starts shutdown sequence
	output wire      disp_off_ready, //shutdown sequence available flag
	
	//Toggle Display command pins, when toggle_disp_start asserted high, sends commands to turn all display pixels on / revert to original state.
	//When ready to use / operation completed, toggle_disp_ready asserted high - start ignored when display off or machine is otherwise busy.
	input wire       toggle_disp_start,
	output wire      toggle_disp_ready,
	
	//OLED command pins
	output wire      SDIN,
	output wire      SCLK,
	output wire      DC,
        output wire      CS,
	output wire      RES,
	output wire      VBAT,
	output wire      VDD
);

//STATE MACHINE CODES
localparam Idle                 = 8'h00;
//STARTUP STATES
localparam Startup              = 8'h10;
localparam StartupFetch         = 8'h11;
//ACTIVE STATES
localparam ActiveWait           = 8'h20;
localparam ActiveUpdatePage     = 8'h21;
localparam ActiveUpdateScreen   = 8'h22;
localparam ActiveSendByte       = 8'h23;
localparam ActiveUpdateWait     = 8'h24;
localparam ActiveToggleDisp     = 8'h25;
localparam ActiveToggleDispWait = 8'h26;
localparam ActiveWrite          = 8'h27;
localparam ActiveWriteTran      = 8'h28;
localparam ActiveWriteWait      = 8'h29;
//BRINGDOWN STATES
localparam BringdownDispOff     = 8'h30;
localparam BringdownVbatOff     = 8'h31;
localparam BringdownDelay       = 8'h32;
localparam BringdownVddOff      = 8'h33;
//UTILITY/MISCELLANEOUS STATES
localparam UtilitySpiWait      = 8'h41;
localparam UtilityDelayWait    = 8'h42;
localparam UtilityFullDispWait = 8'h43;

/*
- Details of OLED Commands can be found in the Solomon Systech SSD1306 Datasheet
*/

reg   [7:0] state              = Idle;
reg   [7:0] after_state        = Idle;
reg   [7:0] after_page_state   = Idle;
reg   [7:0] after_char_state   = Idle;
reg   [7:0] after_update_state = Idle;
reg         disp_is_full = 0;
reg         clear_screen = 0;

reg   [2:0] update_page_count=0;
reg   [1:0] temp_page=0;
reg   [6:0] temp_index=0;

reg 	   	oled_dc=1;
reg 	   	oled_res=1;
reg 	   	oled_vdd=1;
reg 	   	oled_vbat=1;

reg        	temp_spi_start=0;
reg   [7:0] temp_spi_data=0;
wire 		temp_spi_done;

reg 		temp_delay_start=0;
reg  [11:0] temp_delay_ms=0;
wire 		temp_delay_done;

reg   [7:0] temp_write_ascii=0;
reg   [8:0] temp_write_base_addr=0;

wire  [9:0] char_lib_addr;
wire  [8:0] pbuf_read_addr;
wire  [7:0] pbuf_read_data;
wire        pbuf_write_en;
wire  [7:0] pbuf_write_data;
wire  [8:0] pbuf_write_addr;

reg   [2:0] write_byte_count=0;

wire [15:0] init_operation;
reg   [3:0] startup_count=0;
reg         iop_state_select=0;
reg         iop_res_set=0;
reg         iop_res_val=0;
reg         iop_vbat_set=0;
reg         iop_vbat_val=0;
reg         iop_vdd_set=0;
reg         iop_vdd_val=0;
reg   [7:0] iop_data=0;

//non-spi oled control signals
assign DC   = oled_dc;
assign RES  = oled_res;
assign VDD  = oled_vdd;
assign VBAT = oled_vbat;

//controller for spi connection to oled
SpiCtrl SPI_CTRL (
    .clk		(clk),
    .send_start	(temp_spi_start),
    .send_data	(temp_spi_data),
    .send_ready	(temp_spi_done),
    .CS			(CS),
    .SDO		(SDIN),
    .SCLK		(SCLK)
);

//delay controller to handle N-millisecond waits
delay_ms MS_DELAY (
    .clk			(clk),
    .delay_start	(temp_delay_start),
    .delay_time_ms	(temp_delay_ms),
    .delay_done		(temp_delay_done)
);

//combinatorial control signals for memories
assign pbuf_read_addr = {temp_page, temp_index};
assign char_lib_addr = {temp_write_ascii, write_byte_count};
assign pbuf_write_en = (state == ActiveWrite) ? 1'b1 : 1'b0;
assign pbuf_write_addr = temp_write_base_addr + write_byte_count;

//read only memory for character bitmaps
charLib CHAR_LIB (
    .clka(clk),
    .addra(char_lib_addr),
    .douta(pbuf_write_data)
);

//pixel buffer
pixel_buffer PIXEL_BUFFER (
    .clka  (clk),
    .wea   (pbuf_write_en),
    .addra (pbuf_write_addr),
    .dina  (pbuf_write_data),
    .clkb  (clk),
    .addrb (pbuf_read_addr),
    .doutb (pbuf_read_data)
);

//initialization sequence op code look up
init_sequence_rom INIT_SEQ (
    .clka(clk),
    .addra(startup_count),
    .douta(init_operation)
);

//handshake flags, ready means associated start will be accepted
assign disp_on_ready     = (state == Idle       && disp_on_start     == 1'b0) ? 1'b1 : 1'b0;
assign update_ready      = (state == ActiveWait && update_start      == 1'b0) ? 1'b1 : 1'b0;
assign write_ready       = (state == ActiveWait && write_start       == 1'b0) ? 1'b1 : 1'b0;
assign disp_off_ready    = (state == ActiveWait && disp_off_start    == 1'b0) ? 1'b1 : 1'b0;
assign toggle_disp_ready = (state == ActiveWait && toggle_disp_start == 1'b0) ? 1'b1 : 1'b0;

//state machine
always@(posedge clk)
	case (state)
	Idle: begin
        if (disp_on_start) begin
//            state    <= StartupVddOn;
            startup_count <= 'b0;
            state <= StartupFetch;
        end
        disp_is_full <= 1'b0;
    end
    /*
    INITIALIZATION SEQUENCE: (contained in init_sequence.dat)
    Turn VDD on (active low), delay 1ms
    Send DisplayOff command (hAE)
    Turn RES on (active low), delay 1ms
    Turn RES off (active low), delay 1ms
    Send ChargePump1 command (h8D)
    Send ChargePump2 command (h14)
    Send PreCharge1 command (hD9)
    Send PreCharge2 command (hF1)
    Turn VBAT on (active low), delay 100ms
    Send DispContrast1 command (h81)
    Send DispContrast2 command (h0F)
    Send SetSegRemap command (hA0)
    Send SetScanDirection command (hC0)
    Send Set Lower Column Address command (hDA)
    Send Lower Column Address (h00)
    Send Display On command (hAF)
    //*/
    Startup: begin
        oled_dc   <= 1'b0;
        oled_vdd  <= (iop_vdd_set == 1'b1) ? iop_vdd_val : oled_vdd;
        oled_res  <= (iop_res_set == 1'b1) ? iop_res_val : oled_res;
        oled_vbat <= (iop_vbat_set == 1'b1) ? iop_vbat_val : oled_vbat;
        
        if (iop_state_select == 1'b0) begin
            temp_delay_start <= 1'b1;
            temp_delay_ms    <= {4'h0, iop_data};
            state            <= UtilityDelayWait;
        end else begin
            temp_spi_start   <= 1'b1;
            temp_spi_data    <= iop_data;
            state            <= UtilitySpiWait;
        end
        if (startup_count == 4'd15) begin
            //        after_state    <= ActiveWait;
            after_state          <= ActiveUpdatePage;
            after_update_state   <= ActiveWait;
            after_char_state     <= ActiveUpdateScreen;
            after_page_state     <= ActiveUpdateScreen;
            update_page_count    <= 'b0;
            temp_page            <= 'b0;
            temp_index           <= 'b0;
            clear_screen         <= 1'b1;
        end else begin
            after_state   <= StartupFetch;
            startup_count <= startup_count + 1'b1;
        end
    end
    
    StartupFetch: begin
        state            <= Startup;
        iop_state_select <= init_operation[14];
        iop_res_set      <= init_operation[13];
        iop_res_val      <= init_operation[12];
        iop_vdd_set      <= init_operation[11];
        iop_vdd_val      <= init_operation[10];
        iop_vbat_set     <= init_operation[9];
        iop_vbat_val     <= init_operation[8];
        iop_data         <= init_operation[7:0];
    end
	
	ActiveWait: begin
	    if (disp_off_start)
	        state                <= BringdownDispOff;
	    else if (update_start) begin
	        after_update_state   <= ActiveUpdateWait;
	        after_char_state     <= ActiveUpdateScreen;
	        after_page_state     <= ActiveUpdateScreen;
	        state                <= ActiveUpdatePage;
	        update_page_count    <= 'b0;
	        temp_page            <= 'b0;
	        temp_index           <= 'b0;
	        clear_screen         <= update_clear;
        end else if (write_start) begin
            state <= ActiveWriteTran;
            write_byte_count <= 'b0;
            temp_write_ascii     <= write_ascii_data;
            temp_write_base_addr <= write_base_addr;
        end else if (toggle_disp_start) begin
            oled_dc              <= 1'b0;
            disp_is_full         <= ~disp_is_full;
            temp_spi_data        <= 8'hA4 | {7'b0, ~disp_is_full};
            temp_spi_start       <= 1'b1;
            after_state          <= ActiveToggleDispWait;
            state                <= UtilitySpiWait;
        end
    end
    
    ActiveWrite: begin
        if (write_byte_count == 3'd7)
            state <= ActiveWriteWait;
        else
            state <= ActiveWriteTran;
        write_byte_count <= write_byte_count + 1;
    end
    
    ActiveWriteTran: begin
        //give char lib a cycle for read to complete
        state <= ActiveWrite;
    end
    
    ActiveWriteWait: begin
        if (write_start == 0)
            state <= ActiveWait;
        else
            state <= ActiveWriteWait;
        write_byte_count <= 'b0;
    end
    
    ActiveUpdatePage: begin
        case (update_page_count)
        0: temp_spi_data <= 8'h22;
        1: temp_spi_data <= {6'b0, temp_page};
        2: temp_spi_data <= 8'h00;
        3: temp_spi_data <= 8'h10;
        endcase
        if (update_page_count < 4) begin
            oled_dc        <= 1'b0;
            after_state    <= ActiveUpdatePage;
            temp_spi_start <= 1'b1;
            state          <= UtilitySpiWait;
        end else
            state <= after_page_state;
        update_page_count <= update_page_count + 1;
    end
    
    ActiveSendByte: begin
        oled_dc <= 1'b1;
        if (clear_screen == 1'b1) begin
            temp_spi_data  <= 'b0;
            after_state    <= after_char_state;
            state          <= UtilitySpiWait;
            temp_spi_start <= 1'b1;
        end else begin
            temp_spi_data  <= pbuf_read_data;
            after_state    <= after_char_state;
            state          <= UtilitySpiWait;
            temp_spi_start <= 1'b1;
        end
    end
    
    ActiveUpdateScreen: begin
        if (temp_index == 7'd127) begin
            temp_index        <= 'b0;
            temp_page         <= temp_page + 1;
            update_page_count <= 'b0;
            after_char_state  <= ActiveUpdatePage;
            if (temp_page == 2'd3)
                after_page_state <= after_update_state;
            else
                after_page_state <= ActiveUpdateScreen;
        end else begin
            temp_index <= temp_index + 1;
            after_char_state <= ActiveUpdateScreen;
        end
        state <= ActiveSendByte;
    end
    
    ActiveUpdateWait: begin
        if (update_start == 1'b0)
            state <= ActiveWait;
    end
    
    ActiveToggleDispWait: begin
        if (toggle_disp_start == 1'b0)
            state <= ActiveWait;
    end
    
    //Bringdown States:
    //1. turn off display
    //2. power off vbat
    //3. delay 100ms
    //4. power off vdd
	BringdownDispOff: begin
        oled_dc <= 1'b0;
		temp_spi_start <= 1'b1;
		temp_spi_data  <= 8'hAE;
		after_state    <= BringdownVbatOff;
        state          <= UtilitySpiWait;
    end
    BringdownVbatOff: begin
        oled_vbat        <= 1'b0;
        temp_delay_start <= 1'b1;
        temp_delay_ms    <= 12'd100;
        after_state      <= BringdownVddOff;
        state            <= UtilityDelayWait;
    end
    BringdownVddOff: begin
        oled_vdd <= 1'b0;
        if (disp_on_start == 1'b0)
            state <= Idle;
    end
    
	//Utility States, control states for SPI and DELAY handshakes.
    UtilitySpiWait: begin
        temp_spi_start <= 1'b0;
        if(temp_spi_done == 1'b1) begin
            state <= after_state;
        end
    end
    UtilityDelayWait: begin
        temp_delay_start <= 1'b0;
        if(temp_delay_done == 1'b1) begin
            state <= after_state;
        end
    end
    default: state <= Idle;
	endcase
	
endmodule
