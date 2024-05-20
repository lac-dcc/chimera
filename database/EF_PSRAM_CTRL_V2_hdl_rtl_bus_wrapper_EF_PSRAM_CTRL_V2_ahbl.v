// This program was cloned from: https://github.com/efabless/EF_PSRAM_CTRL_V2
// License: Apache License 2.0

/*
	Copyright 2020 Efabless Corp.

	Author: Mohamed Shalan (mshalan@efabless.com)
	
	Licensed under the Apache License, Version 2.0 (the "License"); 
	you may not use this file except in compliance with the License. 
	You may obtain a copy of the License at:
	http://www.apache.org/licenses/LICENSE-2.0
	Unless required by applicable law or agreed to in writing, software 
	distributed under the License is distributed on an "AS IS" BASIS, 
	WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. 
	See the License for the specific language governing permissions and 
	limitations under the License.
*/

`timescale              1ns/1ps
`default_nettype        none

/*
        Address Map:
        0x0070_0000 - 0x0000_0000   : Read/Write from the external PSRAM
        0x008x_01xx                 : RD Command Register
        0x008x_02xx                 : WR Command Register
        0x008x_04xx                 : Enter QPI Command Register
        0x008x_08xx                 : Exit QPI Command Register
        0x008x_10xx                 : Wait States Register
        0x008x_20xx                 : Mode Register, {qpi, qspi}
        0x008x_40xx                 : Initiate/Stop Enter QPI Mode
        0x008x_80xx                 : Initiate/Stop Exit QPI Mode
*/

// Using EBH Command
module EF_PSRAM_CTRL_V2_ahbl #(parameter REGISTER_HWDATA = 1) 
(
    // AHB-Lite Slave Interface
    input   wire            HCLK,
    input   wire            HRESETn,
    input   wire            HSEL,
    input   wire [31:0]     HADDR,
    input   wire [31:0]     HWDATA,
    input   wire [1:0]      HTRANS,
    input   wire [2:0]      HSIZE,
    input   wire            HWRITE,
    input   wire            HREADY,
    output  reg             HREADYOUT,
    output  wire [31:0]     HRDATA,

    // External Interface to Quad I/O
    output  wire            sck,
    output  wire            ce_n,
    input   wire [3:0]      din,
    output  wire [3:0]      dout,
    output  wire [3:0]      douten     
);

    localparam  ST_IDLE = 1'b0,
                ST_WAIT = 1'b1;

    reg         state, nstate;

    //AHB-Lite Address Phase Regs
    reg         last_HSEL;
    reg [31:0]  last_HADDR;
    reg         last_HWRITE;
    reg [1:0]   last_HTRANS;
    reg [2:0]   last_HSIZE;

    wire [2:0]  size =  (last_HSIZE == 0) ? 1 :
                        (last_HSIZE == 1) ? 2 :
                        (last_HSIZE == 2) ? 4 : 4;

    wire        data_cfg        =   ~HADDR[23];
    wire        last_data_cfg   =   ~last_HADDR[23];
    wire        control         =   HADDR[22];
    wire        ahb_addr_phase  =   HTRANS[1] & HSEL & HREADY;

    wire        rd_wr;
    wire [3:0]  wait_states;
    wire [7:0]  cmd;
    wire        qspi;
    wire        qpi;
    
    // Hand-shaking Signals
    wire        start;
    wire        done;

    always@ (posedge HCLK or negedge HRESETn) begin
        if (!HRESETn) begin
            last_HSEL       <= 0;
            last_HADDR      <= 0;
            last_HWRITE     <= 0;
            last_HTRANS     <= 0;
            last_HSIZE      <= 0;
        end
        else if(HREADY) begin
            last_HSEL       <= HSEL;
            last_HADDR      <= HADDR;
            last_HWRITE     <= HWRITE;
            last_HTRANS     <= HTRANS;
            last_HSIZE      <= HSIZE;
        end
    end

    // Configuration Interface
    reg [7:0]   RD_CMD_REG;
    reg [7:0]   WR_CMD_REG;
    reg [7:0]   EQPI_CMD_REG;
    reg [7:0]   XQPI_CMD_REG;
    reg [3:0]   WAIT_STATES_REG;
    reg [1:0]   MODE_REG;
    reg         ENTER_QPI_REG;
    reg         EXIT_QPI_REG;

    always@(posedge HCLK or negedge HRESETn)
        if(!HRESETn) begin
            RD_CMD_REG      <= 8'h03;
            WR_CMD_REG      <= 8'h02;
            EQPI_CMD_REG    <= 8'h35;
            XQPI_CMD_REG    <= 8'hF5;
            WAIT_STATES_REG <= 8'd0;
            MODE_REG        <= 2'd0;
            ENTER_QPI_REG   <= 1'b0;
            EXIT_QPI_REG    <= 1'b0;
        end
        else if(~last_data_cfg & last_HWRITE & last_HSEL & last_HTRANS[1]) begin
            if(last_HADDR[8])   RD_CMD_REG      <= HWDATA;
            if(last_HADDR[9])   WR_CMD_REG      <= HWDATA;
            if(last_HADDR[10])  EQPI_CMD_REG    <= HWDATA;
            if(last_HADDR[11])  XQPI_CMD_REG    <= HWDATA;
            if(last_HADDR[12])  WAIT_STATES_REG <= HWDATA;
            if(last_HADDR[13])  MODE_REG        <= HWDATA;
            if(last_HADDR[14])  ENTER_QPI_REG   <= HWDATA;
            if(last_HADDR[15])  EXIT_QPI_REG    <= HWDATA;
            //if(last_HADDR[16])  ENTER_QPI_REG <= 1'b0;
            //if(last_HADDR[16])  EXIT_QPI_REG <= 1'b0;
        end

    assign  wait_states = WAIT_STATES_REG;
    assign  qspi        = MODE_REG[0];
    assign  qpi         = MODE_REG[1];

    // PSRAM Interface
    always @ (posedge HCLK or negedge HRESETn)
        if(HRESETn == 0) 
            state <= ST_IDLE;
        else 
            state <= nstate;

    always @* begin
        case(state)
            ST_IDLE :   
                if(start) 
                    nstate = ST_WAIT;
                else
                    nstate = ST_IDLE;

            ST_WAIT :   
                if((done & last_data_cfg))
                    nstate = ST_IDLE;
                else
                    nstate = ST_WAIT; 
        endcase
    end

    // HREADYOUT Generation
    always @(posedge HCLK or negedge HRESETn)
        if(!HRESETn) 
            HREADYOUT <= 1'b1;
        else
            case (state)
                ST_IDLE :   
                    if((last_ahb_addr_phase|ahb_addr_phase) & data_cfg) 
                        HREADYOUT <= 1'b0;
                    else 
                        HREADYOUT <= 1'b1;

                ST_WAIT :   
                    if((done & last_data_cfg))  
                        HREADYOUT <= 1'b1;
                    else 
                        HREADYOUT <= 1'b0;
            endcase

    assign  rd_wr   =   ~last_HWRITE;
    assign  cmd     =   ENTER_QPI_REG   ?   EQPI_CMD_REG    :
                        EXIT_QPI_REG    ?   XQPI_CMD_REG    :
                        rd_wr           ?   RD_CMD_REG      :
                        WR_CMD_REG; 
    
    wire    short_cmd   =   (ENTER_QPI_REG|EXIT_QPI_REG);
    wire [23:0] mctrl_addr = {1'b0,last_HADDR[22:0]};

    //generate    
    //    if(REGISTER_HWDATA) begin
        
            reg [31:0]  data_i;
            reg         last_ahb_addr_phase;

            always @(posedge HCLK or negedge HRESETn) begin
                if(!HRESETn)
                    last_ahb_addr_phase <= 0;
                else
                    last_ahb_addr_phase <= ahb_addr_phase;
            end
            
            always @(posedge HCLK)
                if(last_ahb_addr_phase)
                    data_i <= HWDATA;
            
            assign  start   =   ( last_ahb_addr_phase & (state == ST_IDLE ) & data_cfg );
        
        //end 
        //else begin
        /*
            wire [31:0] data_i = HWDATA;
            assign  start   =   ( ahb_addr_phase & (state == ST_IDLE ) & data_cfg );
        */
        //end    
    //endgenerate
    
    EF_PSRAM_CTRL_V2 MCTRL(
        .clk(HCLK), 
        .rst_n(HRESETn), 
	    .addr(mctrl_addr), 
        .data_i(data_i),
        .data_o(HRDATA),
        .size(size),
        .start(start),
        .done(done), 
        .wait_states(wait_states),
        .cmd(cmd),
        .rd_wr(rd_wr),
        .qspi(qspi),
        .qpi(qpi),
        .sck(sck), 
        .ce_n(ce_n), 
        .din(din), 
        .dout(dout), 
        .douten(douten),
        .short_cmd(short_cmd)
    );
    
endmodule


