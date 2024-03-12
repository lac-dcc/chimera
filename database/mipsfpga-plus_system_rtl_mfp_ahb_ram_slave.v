`include "mfp_ahb_lite.vh"
`include "mfp_ahb_lite_matrix_config.vh"

module mfp_ahb_ram_slave
# (
    parameter ADDR_WIDTH = 6
)
(
    input         HCLK,
    input         HRESETn,
    input  [31:0] HADDR,
    input  [ 2:0] HBURST,
    input         HMASTLOCK,
    input  [ 3:0] HPROT,
    input         HSEL,
    input  [ 2:0] HSIZE,
    input  [ 1:0] HTRANS,
    input  [31:0] HWDATA,
    input         HWRITE,
    input         HREADY,
    output [31:0] HRDATA,
    output        HREADYOUT,
    output        HRESP,
    input         SI_Endian
);
    wire [ ADDR_WIDTH - 1 : 0 ] read_addr;
    wire                        read_enable;
    wire [ ADDR_WIDTH - 1 : 0 ] write_addr;
    wire [              3 : 0 ] write_mask;
    wire                        write_enable;

    assign HRESP  = 1'b0;

    wire [31:0] HRDATA_from_ram;

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

    `ifdef MFP_USE_BYTE_MEMORY
        generate
            genvar i;

            for (i = 0; i <= 3; i = i + 1)
            begin : u
                mfp_dual_port_ram
                # (
                    .ADDR_WIDTH ( ADDR_WIDTH ),
                    .DATA_WIDTH ( 8          )
                )
                ram
                (
                    .clk          ( HCLK                           ),
                    .read_addr    ( read_addr                      ),
                    .write_addr   ( write_addr                     ),
                    .write_data   ( HWDATA          [ i * 8 +: 8 ] ),
                    .write_enable ( write_mask      [ i ]          ),
                    .read_data    ( HRDATA_from_ram [ i * 8 +: 8 ] )
                );
            end
        endgenerate

    `else
        mfp_dual_port_ram
        #(
            .ADDR_WIDTH ( ADDR_WIDTH ),
            .DATA_WIDTH ( 32         )
        )
        ram
        (
            .clk          ( HCLK            ),
            .read_addr    ( read_addr       ),
            .write_addr   ( write_addr      ),
            .write_data   ( HWDATA          ),
            .write_enable ( write_enable    ),
            .read_data    ( HRDATA_from_ram )
        );
    `endif

    `ifdef SIMULATION

        assign HRDATA = HRDATA_from_ram;

    `elsif MFP_INITIALIZE_MEMORY_FROM_TXT_FILE

        assign HRDATA = HRDATA_from_ram;

    `elsif MFP_USE_UART_PROGRAM_LOADER

        // We check if ram was ever written.
        // If not, we return hardcoded program.

        reg ram_was_ever_written;

        always @ (posedge HCLK or negedge HRESETn)
            if (! HRESETn)
                ram_was_ever_written <= 1'b0;
            else if (write_enable)
                ram_was_ever_written <= 1'b1;

        reg [31:0] HRDATA_hardcoded;

        always @*
            case (HADDR)
            32'h1fc00000 : HRDATA_hardcoded = 32'h00001825;  // move  v1,zero
            32'h1fc00004 : HRDATA_hardcoded = 32'h00002825;  // move  a1,zero
            32'h1fc00008 : HRDATA_hardcoded = 32'h3c04bf80;  // lui   a0,0xbf80
            32'h1fc0000c : HRDATA_hardcoded = 32'h00053600;  // sll   a2,a1,0x18
            32'h1fc00010 : HRDATA_hardcoded = 32'h00031202;  // srl   v0,v1,0x8
            32'h1fc00014 : HRDATA_hardcoded = 32'h00c21025;  // or    v0,a2,v0
            32'h1fc00018 : HRDATA_hardcoded = 32'h7c023804;  // ins   v0,zero,0x0,0x8
            32'h1fc0001c : HRDATA_hardcoded = 32'h306600ff;  // andi  a2,v1,0xff
            32'h1fc00020 : HRDATA_hardcoded = 32'h00461025;  // or    v0,v0,a2
            32'h1fc00024 : HRDATA_hardcoded = 32'h00023202;  // srl   a2,v0,0x8
            32'h1fc00028 : HRDATA_hardcoded = 32'hac860000;  // sw    a2,0(a0)
            32'h1fc0002c : HRDATA_hardcoded = 32'h8c860000;  // lw    a2,0(a0)
            32'h1fc00030 : HRDATA_hardcoded = 32'hac860004;  // sw    a2,4(a0)
            32'h1fc00034 : HRDATA_hardcoded = 32'hac820010;  // sw    v0,16(a0)
            32'h1fc00038 : HRDATA_hardcoded = 32'h24620001;  // addiu v0,v1,1
            32'h1fc0003c : HRDATA_hardcoded = 32'h0043302b;  // sltu  a2,v0,v1
            32'h1fc00040 : HRDATA_hardcoded = 32'h00401825;  // move  v1,v0
            32'h1fc00044 : HRDATA_hardcoded = 32'h1000fff1;  // b     0x1fc0000c
            32'h1fc00048 : HRDATA_hardcoded = 32'h00c52821;  // addu  a1,a2,a1
            default      : HRDATA_hardcoded = 32'h00000000;
            endcase

        reg [31:0] HRDATA_hardcoded_reg;

        always @ (posedge HCLK)
            HRDATA_hardcoded_reg <= HRDATA_hardcoded;

        assign HRDATA = ram_was_ever_written ?
            HRDATA_from_ram : HRDATA_hardcoded_reg;

    `else

        assign HRDATA = HRDATA_from_ram;

    `endif

endmodule
