
`include "mfp_ahb_lite.vh"
`include "mfp_ahb_lite_matrix_config.vh"

module mfp_ahb_lite_pmod_als
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
    output     [31:0] HRDATA,
    output            HREADYOUT,
    output            HRESP,
    input             SI_Endian,

    output            SPI_CS,
    output            SPI_SCK,
    input             SPI_SDO
);
    assign HREADYOUT = 1'b1;
    assign HRESP     = 1'b0;

    wire   [15:0] alsData;
    assign HRDATA = { 16'b0, alsData };

    mfp_pmod_als_spi_receiver mfp_pmod_als_spi_receiver
    (
        .clock   (   HCLK           ),
        .reset_n (   HRESETn        ),
        .cs      (   SPI_CS         ),
        .sck     (   SPI_SCK        ),
        .sdo     (   SPI_SDO        ),
        .value   (   alsData        )
    );

endmodule
