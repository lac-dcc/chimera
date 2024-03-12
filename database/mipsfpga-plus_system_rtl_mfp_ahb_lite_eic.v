/* Simple external interrupt controller for MIPSfpga+ system 
 * managed using AHB-Lite bus
 * Copyright(c) 2017 Stanislav Zhelnio
 */  

`include "mfp_eic_core.vh"

module mfp_ahb_lite_eic
(
    //ABB-Lite side
    input                              HCLK,
    input                              HRESETn,
    input      [ 31 : 0 ]              HADDR,
    input      [  2 : 0 ]              HBURST,     // ignored
    input                              HMASTLOCK,  // ignored
    input      [  3 : 0 ]              HPROT,      // ignored
    input                              HSEL,
    input      [  2 : 0 ]              HSIZE,      // ignored
    input      [  1 : 0 ]              HTRANS,
    input      [ 31 : 0 ]              HWDATA,
    input                              HWRITE,
    input                              HREADY,
    output reg [ 31 : 0 ]              HRDATA,
    output                             HREADYOUT,
    output                             HRESP,
    input                              SI_Endian,  // ignored

    //Interrupt signal side
    input      [ `EIC_CHANNELS-1 : 0 ] EIC_input,

    //CPU side
    output     [ 17 : 1 ]              EIC_Offset,    // connect to SI_Offset
    output     [  3 : 0 ]              EIC_ShadowSet, // connect to SI_EISS
    output     [  7 : 0 ]              EIC_Interrupt, // connect to SI_Int
    output     [  5 : 0 ]              EIC_Vector,    // connect to SI_EICVector
    output                             EIC_Present,   // connect to SI_EICPresent
    input                              EIC_IAck,      // connect to SI_IAck
    input      [  7 : 0 ]              EIC_IPL,       // connect to SI_IPL
    input      [  5 : 0 ]              EIC_IVN,       // connect to SI_IVN
    input      [ 17 : 1 ]              EIC_ION        // connect to SI_ION
);
    assign      HRESP  = 1'b0;

    wire [ `EIC_ADDR_WIDTH - 1 : 0 ] read_addr;
    wire                             read_enable;
    wire [                  31 : 0 ] read_data;
    wire [ `EIC_ADDR_WIDTH - 1 : 0 ] write_addr;
    wire [                   3 : 0 ] write_mask;
    wire                             write_enable;
    wire [                  31 : 0 ] write_data;

    assign      write_data  = HWDATA;

    always @ (posedge HCLK or negedge HRESETn) begin
        if (! HRESETn)
            HRDATA <= 32'b0;
        else
            if(read_enable) HRDATA <= read_data;
    end

    mfp_ahb_lite_slave 
    #(
        .ADDR_WIDTH ( `EIC_ADDR_WIDTH ),
        .ADDR_START (               2 )
    )
    decoder
    (
        .HCLK           ( HCLK          ),
        .HRESETn        ( HRESETn       ),
        .HADDR          ( HADDR         ),
        .HSIZE          ( HSIZE         ),
        .HTRANS         ( HTRANS        ),
        .HWRITE         ( HWRITE        ),
        .HSEL           ( HSEL          ),
        .HREADY         ( HREADY        ),
        .HREADYOUT      ( HREADYOUT     ),
        .read_enable    ( read_enable   ),
        .read_addr      ( read_addr     ),
        .write_enable   ( write_enable  ),
        .write_addr     ( write_addr    ),
        .write_mask     ( write_mask    )
    );

    mfp_eic_core eic_core
    (
        .CLK            ( HCLK          ),
        .RESETn         ( HRESETn       ),
        .signal         ( EIC_input     ),
        .read_addr      ( read_addr     ),
        .read_data      ( read_data     ),
        .write_addr     ( write_addr    ),
        .write_data     ( write_data    ),
        .write_enable   ( write_enable  ),
        .EIC_Offset     ( EIC_Offset    ),
        .EIC_ShadowSet  ( EIC_ShadowSet ),
        .EIC_Interrupt  ( EIC_Interrupt ),
        .EIC_Vector     ( EIC_Vector    ),
        .EIC_Present    ( EIC_Present   ),
        .EIC_IAck       ( EIC_IAck      ),
        .EIC_IPL        ( EIC_IPL       ),
        .EIC_IVN        ( EIC_IVN       ),
        .EIC_ION        ( EIC_ION       )
    );

endmodule
