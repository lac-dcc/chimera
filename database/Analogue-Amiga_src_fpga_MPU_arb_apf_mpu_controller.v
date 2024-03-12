`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.04.2023 20:38:48
// Design Name: 
// Module Name: arb_apf_mpu_controller
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module arb_apf_mpu_controller(
    input wire          clk,
    input wire          reset_n,

    
    input  wire         dBus_cmd_valid,
    output reg          dBus_cmd_ready,
    input  wire         dBus_cmd_payload_wr,
    input  wire[31:0]   dBus_cmd_payload_address,
    input  wire[31:0]   dBus_cmd_payload_data,
    input  wire[1:0]    dBus_cmd_payload_size,
    output reg          dBus_rsp_ready = 0,
    output reg          dBus_rsp_error = 0,
    output reg [31:0]   dBus_rsp_data = 0,  

    input  wire[31:0]   apf_address,
    input  wire[31:0]   apf_data_in,
    output reg [31:0]   apf_data_out = 0,
    input  wire         apf_write,
    input  wire         apf_read,

    input  wire         bram_valid,
    output reg          bram_write = 0,
    output reg          bram_request = 0,
    output reg [23:0]   bram_address = 0,
    output reg [3:0]    bram_mask = 0,
    output reg [31:0]   bram_data_out = 0,
    input  wire[31:0]   bram_data_in,

    input  wire         sram_input_valid,
    output reg          sram_write = 0,
    output reg          sram_request = 0,
    output reg [23:0]   sram_address = 0,
    output reg [3:0]    sram_mask = 0,
    output reg [31:0]   sram_data_out = 0,
    input  wire[31:0]   sram_data_in,

    input  wire         pram0_input_valid,
    output reg          pram0_write = 0,
    output reg          pram0_request = 0,
    output reg [23:0]   pram0_address = 0,
    output reg [3:0]    pram0_mask = 0,
    output reg [31:0]   pram0_data_out = 0,
    input  wire[31:0]   pram0_data_in,

    input  wire         pram1_input_valid,
    output reg          pram1_write = 0,
    output reg          pram1_request = 0,
    output reg [23:0]   pram1_address = 0,
    output reg [3:0]    pram1_mask = 0,
    output reg [31:0]   pram1_data_out = 0,
    input  wire[31:0]   pram1_data_in,

    input  wire         sdram_input_valid,
    output reg          sdram_write = 0,
    output reg          sdram_request = 0,
    output reg [25:0]   sdram_address = 0,
    output reg [3:0]    sdram_mask = 0,
    output reg [31:0]   sdram_data_out = 0,
    input  wire[31:0]   sdram_data_in,

    input  wire         apf_reg_input_valid,
    output reg          apf_reg_write = 0,
    output reg          apf_reg_request = 0,
    output reg [23:0]   apf_reg_address = 0,
    output reg [3:0]    apf_reg_mask = 0,
    output reg [31:0]   apf_reg_data_out = 0,
    input  wire[31:0]   apf_reg_data_in,

    input  wire         int_reg_input_valid,
    output reg          int_reg_write = 0,
    output reg          int_reg_request = 0,
    output reg [31:0]   int_reg_address = 0,
    output reg [3:0]    int_reg_mask = 0,
    output reg [31:0]   int_reg_data_out = 0,
    input  wire[31:0]   int_reg_data_in

    );

// internal bus controller
// This mux process also works for the addressing where the top 4 bits are used for the address locations
parameter       bram_mux_process    =   0,
                sram_mux_process    =   1,
                pram0_mux_process   =   2,
                pram1_mux_process   =   3,
                sdram_mux_process   =   4,
                apf_reg_mux_process =   5,
                int_reg_mux_process =   6;

parameter       bus_state_process_idle              = 0,
                bus_state_process_cpu_requested     = 1,
                bus_state_process_cpu_wait          = 2,
                bus_state_process_cpu_completed     = 3,
                bus_state_process_apf_requested     = 4,
                bus_state_process_apf_wait          = 5,
                bus_state_process_apf_completed     = 6;


    reg [2:0]       bus_state_process = 0;  // setup the muxes for the return or sending data to the ram or interface cores;  
    reg [3:0]       bus_mux_process = 0;  // setup the muxes for the return or sending data to the ram or interface cores;  
    reg [31:0]      bus_data_reg_input = 0; // sends the data back on the bus to the CPU or APF state machines


    reg             bus_input_valid = 0;
    reg [31:0]      bus_input_data = 0;

    reg             bus_output_write = 0;
    reg             bus_output_request = 0;
    reg [31:0]      bus_output_address = 0;
    reg [31:0]      bus_output_data = 0;
    reg [3:0]       bus_output_mask = 0;

    reg             cpu_bus_done = 0;
    reg             apf_bus_done = 0;

    // BIG MUX for the output for the cores.
    // Will need to check no latches are made here

    always @* begin 

        bram_write          <=  0;
        bram_request        <=  0;
        bram_address        <=  0;
        bram_mask           <=  0;
        bram_data_out       <=  0;
        sram_write          <=  0;
        sram_request        <=  0;
        sram_address        <=  0;
        sram_mask           <=  0;
        sram_data_out       <=  0;
        pram0_write         <=  0;
        pram0_request       <=  0;
        pram0_address       <=  0;
        pram0_mask          <=  0;
        pram0_data_out      <=  0;
        pram1_write         <=  0;
        pram1_request       <=  0;
        pram1_address       <=  0;
        pram1_mask          <=  0;
        pram1_data_out      <=  0;
        sdram_write         <=  0;
        sdram_request       <=  0;
        sdram_address       <=  0;
        sdram_mask          <=  0;
        sdram_data_out      <=  0;
        apf_reg_write       <=  0;
        apf_reg_request     <=  0;
        apf_reg_address     <=  0;
        apf_reg_mask        <=  0;
        apf_reg_data_out    <=  0;
        int_reg_write       <=  0;
        int_reg_request     <=  0;
        int_reg_address     <=  0;
        int_reg_mask        <=  0;
        int_reg_data_out    <=  0;
        bus_input_valid     <=  0;
        bus_input_data      <=  0;

        case (bus_mux_process) 
        bram_mux_process        : begin 
            bus_input_valid     <=  bram_valid;
            bus_input_data      <=  bram_data_in;
            bram_write          <=  bus_output_write;
            bram_request        <=  bus_output_request;
            bram_address        <=  bus_output_address;
            bram_mask           <=  bus_output_mask;
            bram_data_out       <=  bus_output_data;
        end 

        sram_mux_process        : begin 
            bus_input_valid     <=  sram_input_valid;
            bus_input_data      <=  sram_data_in;
            sram_write          <=  bus_output_write;
            sram_request        <=  bus_output_request;
            sram_address        <=  bus_output_address;
            sram_mask           <=  bus_output_mask;
            sram_data_out       <=  bus_output_data;
        end 
        
        pram0_mux_process       : begin 
            bus_input_valid     <=  pram0_input_valid;
            bus_input_data      <=  pram0_data_in;
            pram0_write          <=  bus_output_write;
            pram0_request        <=  bus_output_request;
            pram0_address        <=  bus_output_address;
            pram0_mask           <=  bus_output_mask;
            pram0_data_out       <=  bus_output_data;
        end 
        
        pram1_mux_process       : begin 
            bus_input_valid     <=  pram1_input_valid;
            bus_input_data      <=  pram1_data_in;
            pram1_write          <=  bus_output_write;
            pram1_request        <=  bus_output_request;
            pram1_address        <=  bus_output_address;
            pram1_mask           <=  bus_output_mask;
            pram1_data_out       <=  bus_output_data;
        end 
        
        sdram_mux_process       : begin 
            bus_input_valid     <=  sdram_input_valid;
            bus_input_data      <=  sdram_data_in;
            sdram_write          <=  bus_output_write;
            sdram_request        <=  bus_output_request;
            sdram_address        <=  bus_output_address;
            sdram_mask           <=  bus_output_mask;
            sdram_data_out       <=  bus_output_data;
        end 
        
        apf_reg_mux_process     : begin 
            bus_input_valid     <=  apf_reg_input_valid;
            bus_input_data      <=  apf_reg_data_in;
            apf_reg_write       <=  bus_output_write;
            apf_reg_request     <=  bus_output_request;
            apf_reg_address     <=  bus_output_address;
            apf_reg_mask        <=  bus_output_mask;
            apf_reg_data_out    <=  bus_output_data;
        end 
        
        default     : begin 
            bus_input_valid     <=  int_reg_input_valid;
            bus_input_data      <=  int_reg_data_in;
            int_reg_write       <=  bus_output_write;
            int_reg_request     <=  bus_output_request;
            int_reg_address     <=  bus_output_address;
            int_reg_mask        <=  bus_output_mask;
            int_reg_data_out    <=  bus_output_data;
        end 
        
        endcase 
    end

    reg cpu_bus_granted =0;
    reg apf_bus_granted =0 ;
    reg apf_bus_request = 0;

    always @(posedge clk) begin 
        
        cpu_bus_granted     <= 0;
        apf_bus_granted     <= 0;
        bus_output_request  <= 0;
        cpu_bus_done        <= 0;
        apf_bus_done        <= 0;

        case (bus_state_process)
        bus_state_process_idle              : begin 
            if (apf_bus_request) begin 
                bus_state_process       <= bus_state_process_apf_requested;
                bus_mux_process         <= apf_address[31:28];
            end 
            else if (cpu_bus_request) begin 
                bus_state_process       <= bus_state_process_cpu_requested;
                bus_mux_process         <= cpu_address[31:28];
            end 
        end 

        bus_state_process_cpu_requested     : begin 
            cpu_bus_granted         <= 1;
            bus_output_write        <= cpu_write_sig;
            bus_output_address      <= cpu_address;
            bus_output_data         <= cpu_write_data;
            bus_output_mask         <= cpu_write_mask_sig;
            bus_state_process       <= bus_state_process_cpu_wait;
            bus_output_request      <= 1;
        end 
        
        bus_state_process_cpu_wait          : begin 
            bus_output_request      <= 0;
            if (bus_input_valid) begin 
                    bus_state_process       <= bus_state_process_cpu_completed;
            end 
            bus_data_reg_input              <= bus_input_data;
        end 

        bus_state_process_cpu_completed     : begin 
            cpu_bus_done        <= 1;
            bus_state_process   <= bus_state_process_idle;

        end 

        bus_state_process_apf_requested     : begin 
        apf_bus_granted         <= 1;
        bus_output_write        <= apf_write_sig;
        bus_output_address      <= apf_address_reg;
        bus_output_data         <= apf_write_data;
        bus_output_mask         <= apf_write_mask_sig;
        bus_state_process       <= bus_state_process_apf_wait;

        end 

        bus_state_process_apf_wait          : begin 
            if (bus_input_valid)    begin 
                    bus_output_request      <= 0;
                    bus_state_process       <= bus_state_process_apf_completed;
            end
            else    bus_output_request      <= 1;
            bus_data_reg_input              <= bus_input_data;
        end 

        bus_state_process_apf_completed     : begin 
            apf_bus_done        <= 1;
            bus_state_process   <= bus_state_process_idle;

        end 

        endcase
    end

/****************************************************************************************************************** 
    Master CPU interface
    this controls the interface on the data side of the Vexrisc CPU
    also created a delay when required too for external memorys as well, Helps tidy up the issues im having with 
    a duel port BRAM for the data side.

    This allows the CPU to still have access to the BRAM on the instruction side, But this will cause a bit of a
    slow down on the data side.

    But this allows a DMA like process for the APF bus as well to the Memory cores as well. So we can just transfer
    memory from the APF to the memory cores directly if needed and the MPU can access them too

******************************************************************************************************************/

    parameter   cpu_idle_state        = 0,
                cpu_request_state     = 1,
                cpu_wait_state        = 2,
                cpu_completed_state   = 3;

    reg [2:0]   cpu_state = 0;
    reg [31:0]  cpu_address = 0;
    reg [31:0]  cpu_write_data = 0;
    reg [3:0]   cpu_write_mask_sig = 0;
    reg         cpu_write_sig = 0;
    reg         cpu_bus_request = 0;

// now we need to make the core able to read and write from the APF and the instructions side will stop for the processes

reg [3:0] cpu_data_byte_select =0;

always @* begin
	case ({dBus_cmd_payload_size,dBus_cmd_payload_address[1:0]})
    // bytes
		{2'b00, 2'b00}  : cpu_data_byte_select <= 4'b0001;
		{2'b00, 2'b01}  : cpu_data_byte_select <= 4'b0010;
		{2'b00, 2'b10}  : cpu_data_byte_select <= 4'b0100;
		{2'b00, 2'b11}  : cpu_data_byte_select <= 4'b1000;
		// half words
		{2'b01, 2'b00}  : cpu_data_byte_select <= 4'b0011;
		{2'b01, 2'b01}  : cpu_data_byte_select <= 4'b0110;
		{2'b01, 2'b10}  : cpu_data_byte_select <= 4'b1100;
		{2'b01, 2'b11}  : cpu_data_byte_select <= 4'b1000;
		// full words
		default  	    : cpu_data_byte_select <= 4'b1111;
	endcase
end


/********************************** 
 * 
 * CPU control signals
input               dBus_cmd_valid,
output reg          dBus_cmd_ready,
input               dBus_cmd_payload_wr,
input      [31:0]   dBus_cmd_payload_address,
input      [31:0]   dBus_cmd_payload_data,
input      [1:0]    dBus_cmd_payload_size,
output reg          dBus_rsp_ready,
output reg          dBus_rsp_error,
output reg [31:0]   dBus_rsp_data,  

************************************/
    always @(posedge clk or negedge reset_n) begin 
        if (!reset_n) begin 
            cpu_state           <= cpu_idle_state;
            cpu_address         <= 32'h0;
            cpu_write_data      <= 32'h0;
            cpu_write_mask_sig  <= 4'h0;
            cpu_write_sig       <= 1'b0;
            dBus_rsp_error      <= 1'b0;
            dBus_rsp_data       <= 32'b0;
            cpu_bus_request     <= 1'b0;
        end 
        else begin 
            cpu_bus_request     <= 1'b0;
            case (cpu_state)

            // this is where the CPU state will send to the bus controller we want access on the granted signal is sent the bus arbitor will
            // collect the address and send it out on all buses and then poll that memory core
            cpu_request_state : begin 
                cpu_bus_request     <= 1'b1;
                if (cpu_bus_granted) begin 
                    cpu_state           <= cpu_wait_state;
                end 
            end 
            // And now we wait for the BUS to come back with data. once done we send that up on the CPU bus ready to be completed
            cpu_wait_state: begin 
                if (cpu_bus_done) begin 
                    cpu_state           <= cpu_completed_state;
                    dBus_rsp_data       <= bus_data_reg_input;
                end 
            end 

            // we do the signal back to the CPU and if there is more data to be written or read we work from there.
            cpu_completed_state: begin 
					if (dBus_cmd_valid) begin 
                    cpu_state           <= cpu_request_state;
                    cpu_address         <= dBus_cmd_payload_address;
                    cpu_write_data      <= dBus_cmd_payload_data;
                    cpu_write_mask_sig  <= cpu_data_byte_select;
                    cpu_write_sig       <= dBus_cmd_payload_wr;
                end 
                else begin 
                    cpu_state           <= cpu_idle_state;
                end 
            end

            // this is the idle state of the CPU and we are just waiting to get it data
            default : begin 
                if (dBus_cmd_valid) begin 
                    cpu_state           <= cpu_request_state;
                    cpu_address         <= dBus_cmd_payload_address;
                    cpu_write_data      <= dBus_cmd_payload_data;
                    cpu_write_mask_sig  <= cpu_data_byte_select;
                    cpu_write_sig       <= dBus_cmd_payload_wr;
                end 
                else begin 
                    cpu_state           <= cpu_idle_state;
                end 
            end     
            endcase 
        end 
    end

    always @* begin
        case (cpu_state)
            cpu_idle_state        : begin
                if (dBus_cmd_valid) dBus_cmd_ready <= 0;
                else dBus_cmd_ready <= 1;
                dBus_rsp_ready <= 0;
            end
            cpu_request_state     : begin
                dBus_cmd_ready <= 0;
                dBus_rsp_ready <= 0;
            end
            cpu_wait_state        : begin
                if (cpu_bus_done) dBus_cmd_ready <= 1;
                else dBus_cmd_ready <= 0;
                dBus_rsp_ready <= 0;
            end
            cpu_completed_state   : begin
                if (dBus_cmd_valid) dBus_cmd_ready <= 0;
                else dBus_cmd_ready <= 1;
                dBus_rsp_ready <= 1;
            end
        endcase
    end

/****************************************************************************************************************** 
    APF interface
    this controls the interface on the data side of the APF Bus in the 32'h0000_0000 to 32'hEFFF_FFFF range

    also created a delay when required too for external memorys as well, Helps tidy up the issues im having with 
    a duel port BRAM for the data side.

    But this allows a DMA like process for the APF bus as well to the Memory cores as well. So we can just transfer
    memory from the APF to the memory cores directly if needed and the MPU can access them too

******************************************************************************************************************/

parameter   apf_idle_state        = 0,
            apf_request_state     = 1,
            apf_wait_state        = 2,
            apf_completed_state   = 3;

reg [2:0]   apf_state = 0;
reg [31:0]  apf_address_reg = 0;
reg [31:0]  apf_write_data =0;
reg [3:0]   apf_write_mask_sig =0;
reg         apf_write_sig =0;


// now we need to make the core able to read and write from the APF and the instructions side will stop for the processes

/********************************** 
* 
APF Interface

************************************/
reg [31:0] apf_data_out_reg;
reg [31:0] apf_data_out_final;

always @(posedge clk) begin  
        apf_bus_request     <= 1'b0;
        case (apf_state)

        // this is where the CPU state will send to the bus controller we want access on the granted signal is sent the bus arbitor will
        // collect the address and send it out on all buses and then poll that memory core
        apf_request_state : begin 
            apf_bus_request         <= 1'b1;
            if (apf_bus_granted) begin 
                apf_state           <= apf_wait_state;
            end 
        end 
        // And now we wait for the BUS to come back with data. once done we send that up on the CPU bus ready to be completed
        apf_wait_state: begin 
            if (apf_bus_done) begin 
                apf_state           <= apf_completed_state;
                apf_data_out_reg    <= bus_data_reg_input;
            end 
        end 

        // we do the signal back to the CPU and if there is more data to be written or read we work from there.
        apf_completed_state: begin
        apf_state                   <= apf_idle_state;

        end

        // this is the idle state of the CPU and we are just waiting to get it data
        default : begin 
            if (|{apf_write,apf_read} && (apf_address[31] != 1'b1)) begin 
                apf_state           <= apf_request_state;
                apf_address_reg     <= apf_address;
                apf_write_data      <= {apf_data_in[7:0], apf_data_in[15:8], apf_data_in[23:16], apf_data_in[31:24]};
                apf_write_mask_sig  <= 4'hF;
                apf_write_sig       <= apf_write;
					 apf_data_out_final	<= apf_data_out_reg;
            end 
            else begin 
                apf_state           <= apf_idle_state;
            end 
        end     
        endcase 
end

always @(posedge clk) apf_data_out <= {apf_data_out_reg[7:0], apf_data_out_reg[15:8], apf_data_out_reg[23:16], apf_data_out_reg[31:24]};
endmodule 
