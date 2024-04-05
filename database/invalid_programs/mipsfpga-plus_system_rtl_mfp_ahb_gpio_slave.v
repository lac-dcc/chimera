`include "mfp_ahb_lite.vh"
`include "mfp_ahb_lite_matrix_config.vh"

module mfp_ahb_gpio_slave
(
    input             HCLK,
    input             HRESETn,
    input      [31:0] HADDR,
    input      [ 2:0] HBURST,
    input             HMASTLOCK,
    input      [ 3:0] HPROT,
    input      [ 2:0] HSIZE,
    input             HSEL,
    input      [ 1:0] HTRANS,
    input      [31:0] HWDATA,
    input             HWRITE,
    input             HREADY,
    output reg [31:0] HRDATA,
    output            HREADYOUT,
    output            HRESP,
    input             SI_Endian,
               
    input      [`MFP_N_SWITCHES          - 1:0] IO_Switches,
    input      [`MFP_N_BUTTONS           - 1:0] IO_Buttons,
    output reg [`MFP_N_RED_LEDS          - 1:0] IO_RedLEDs,
    output reg [`MFP_N_GREEN_LEDS        - 1:0] IO_GreenLEDs,
    output reg [`MFP_7_SEGMENT_HEX_WIDTH - 1:0] IO_7_SegmentHEX
);

    // Ignored: HMASTLOCK, HPROT
    // TODO: SI_Endian

    parameter ADDR_WIDTH = 4;

    wire [ ADDR_WIDTH - 1 : 0 ] read_addr;
    wire                        read_enable;
    wire [ ADDR_WIDTH - 1 : 0 ] write_addr;
    wire [              3 : 0 ] write_mask;
    wire                        write_enable;

    assign HRESP  = 1'b0;

    mfp_ahb_lite_slave 
    #(
        .ADDR_WIDTH ( ADDR_WIDTH ),
        .ADDR_START (          2 )
    )
    decoder
    (
        .HCLK               ( HCLK              ),
        .HRESETn            ( HRESETn           ),
        .HADDR              ( HADDR             ),
        .HSIZE              ( HSIZE             ),
        .HTRANS             ( HTRANS            ),
        .HWRITE             ( HWRITE            ),
        .HSEL               ( HSEL              ),
        .HREADY             ( HREADY            ),
        .HREADYOUT          ( HREADYOUT         ),
        .read_enable        ( read_enable       ),
        .read_addr          ( read_addr         ),
        .write_enable       ( write_enable      ),
        .write_addr         ( write_addr        ),
        .write_mask         ( write_mask        )
    );

    always @ (posedge HCLK or negedge HRESETn) begin
        if (! HRESETn)
            begin
                IO_RedLEDs      <= `MFP_N_RED_LEDS'b0;
                IO_GreenLEDs    <= `MFP_N_GREEN_LEDS'b0;
                IO_7_SegmentHEX <= `MFP_7_SEGMENT_HEX_WIDTH'b0;

                HRDATA          <= 32'b0;
            end
        else begin
            if(write_enable) begin
                case (write_addr)
                    `MFP_RED_LEDS_IONUM      : IO_RedLEDs      <= HWDATA [`MFP_N_RED_LEDS          - 1:0];
                    `MFP_GREEN_LEDS_IONUM    : IO_GreenLEDs    <= HWDATA [`MFP_N_GREEN_LEDS        - 1:0];
                    `MFP_7_SEGMENT_HEX_IONUM : IO_7_SegmentHEX <= HWDATA [`MFP_7_SEGMENT_HEX_WIDTH - 1:0];
                endcase
            end
            
            if(read_enable) begin
                case (read_addr)
                    `MFP_SWITCHES_IONUM      : HRDATA <= { { 32 - `MFP_N_SWITCHES { 1'b0 } } , IO_Switches };
                    `MFP_BUTTONS_IONUM       : HRDATA <= { { 32 - `MFP_N_BUTTONS  { 1'b0 } } , IO_Buttons  };

                    `MFP_RED_LEDS_IONUM      : HRDATA <= { { 32 - `MFP_N_RED_LEDS           { 1'b0 } } ,IO_RedLEDs      };
                    `MFP_GREEN_LEDS_IONUM    : HRDATA <= { { 32 - `MFP_N_GREEN_LEDS         { 1'b0 } } ,IO_GreenLEDs    };
                    `MFP_7_SEGMENT_HEX_IONUM : HRDATA <= { { 32 - `MFP_7_SEGMENT_HEX_WIDTH  { 1'b0 } } ,IO_7_SegmentHEX };
                    
                    default:                   HRDATA <= 32'b0;
                endcase
            end
        end
    end

endmodule
