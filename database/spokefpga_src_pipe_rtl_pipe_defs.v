
/*

PIPE PREDEFS

PipeSpec Format

   |  Command  |  Command  |  Result   |Rev |SS |DSz|   Data Width    |
   | C C C C C | R R R R R | R R R R R | Rv |SS |DSz| D D D D D D D D |
   | 20     16 |        15 | 15     11 | 10 | 9 | 8 | 7             0 |

Pipe Format

   Full Pipe         | RESTART | COMMAND | COMMAND | RESULT | REV_READY | REV_VALID | REV_START | REV_STOP | REV_DATA_SIZE | REV_DATA | READY | VALID | START | STOP | DATA_SIZE | DATA |

   Most Simple Pipe  | READY | VALID |

   Data Pipe         | READY | VALID | DATA |

We usually know the PipeDataWidth, but we need PipeWidth (and thence the Pipe Most Significant _b to allocate the bus.  Like this:

    reg [`PipeMsb( PipeDataWidth )] pipe_out;


Included at the outset before module definitions

Abbreviations
    P  Pipe
    PS PipeSpec
    _m MSB
    _l LSB
    _b bit
    _w width
    _wm1 width-1
*/

// Bit widths for PS fields
`define PS_DATA_w       (8)
`define PS_DATA_SIZE_w  (1)
`define PS_START_STOP_w (1)
`define PS_REVERSE_w    (1)
`define PS_RESULT_w     (5)
`define PS_COMMAND_w    (5)
`define PS_REQUEST_w    (5)

`define PS_w            ( PS_DATA_w + PS_DATA_SIZE_w + PS_START_STOP_w + PS_REVERSE_w + PS_RESULT_w + PS_COMMAND_w + PS_REQUEST_w  )

// Bit positions for all the PS fields
`define PS_DATA_l       (0)
`define PS_DATA_m       (`PS_DATA_l + `PS_DATA_w - 1)

`define PS_DATA_SIZE_l  (`PS_DATA_m + 1)
`define PS_DATA_SIZE_m  (`PS_DATA_SIZE_l)

`define PS_START_STOP_l (`PS_DATA_SIZE_m + 1)
`define PS_START_STOP_m (`PS_START_STOP_l)

`define PS_REVERSE_l    (`PS_START_STOP_m + 1)
`define PS_REVERSE_m    (`PS_REVERSE_l + `PS_REVERSE_w - 1)

`define PS_COMMAND_l    (`PS_REVERSE_m + 1)
`define PS_COMMAND_m    (`PS_COMMAND_l + `PS_COMMAND_w - 1)

`define PS_RESULT_l     (`PS_COMMAND_m + 1)
`define PS_RESULT_m     (`PS_RESULT_l + `PS_RESULT_w - 1)

`define PS_REQUEST_l    (`PS_RESULT_m + 1)
`define PS_REQUEST_m    (`PS_REQUEST_l)

// Bit masks for PS fields
`define PS_DATA_MASK       ( ( 1 << `PS_DATA_w ) - 1 )
`define PS_DATA_SIZE_MASK  ( ( 1 << `PS_DATA_SIZE_w ) - 1 )
`define PS_START_STOP_MASK ( ( 1 << `PS_START_STOP_w ) - 1 )
`define PS_REVERSE_MASK    ( ( 1 << `PS_REVERSE_w ) - 1 )
`define PS_COMMAND_MASK    ( ( 1 << `PS_COMMAND_w ) - 1 )
`define PS_RESULT_MASK     ( ( 1 << `PS_RESULT_w ) - 1 )
`define PS_REQUEST_MASK    ( ( 1 << `PS_REQUEST_w ) - 1 )

`define PS_DATA_BIT        (`PS_DATA_l)
`define PS_START_STOP_BIT  (`PS_START_STOP_l)
`define PS_DATA_SIZE_BIT   (`PS_DATA_SIZE_l)
`define PS_RESULT_BIT      (`PS_RESULT_l)
`define PS_REVERSE_BIT     (`PS_REVERSE_l)

// .. more spec fields here *must not* change the order

// Masks / Switches for each field in the spec
`define PS_DATA( v )    ( ( v & `PS_DATA_MASK ) << `PS_DATA_l )
`define PS_START_STOP   ( 1 << `PS_START_STOP_BIT )
`define PS_DATA_SIZE    ( 1 << `PS_DATA_SIZE_BIT )
`define PS_REVERSE      ( 1 << `PS_REVERSE_BIT )
`define PS_COMMAND( v ) ( ( v & `PS_COMMAND_MASK ) << `PS_COMMAND_l )
`define PS_RESULT( v )  ( ( v & `PS_RESULT_MASK ) << `PS_RESULT_l )
`define PS_REQUEST( v ) ( ( v & `PS_REQUEST_MASK ) << `PS_REQUEST_l )

`define PS_Reverse_v( spec ) ( spec & `PS_REVERSE )

// .. more spec fields here

// Field widths for a given spec - 0 if not present
`define P_Data_w( spec )        ( ( spec >> `PS_DATA_l ) & `PS_DATA_MASK )
`define P_DataSize_w( spec )    ( ( (( spec >> `PS_DATA_SIZE_l ) & `PS_DATA_SIZE_MASK ) != 0 ) ? ($clog2( `P_Data_w( spec ) ) + 1): 0 )
`define P_Start_w( spec )       ( ( spec >> `PS_START_STOP_l ) & `PS_START_STOP_MASK )
`define P_Stop_w( spec )        ( ( spec >> `PS_START_STOP_l ) & `PS_START_STOP_MASK )
`define P_Valid_w( spec )       ( 1 )
`define P_Ready_w( spec )       ( 1 )
`define P_RevData_w( spec )     ( (( spec & `PS_REVERSE ) != 0 ) ? ( ( spec >> `PS_DATA_l ) & `PS_DATA_MASK ) : 0 )
`define P_RevDataSize_w( spec ) ( (( spec & `PS_REVERSE ) != 0 ) ? ( (( ( spec >> `PS_DATA_SIZE_l ) & `PS_DATA_SIZE_MASK ) != 0 ) ? ($clog2( `P_Data_w( spec ) ) + 1): 0 ) : 0 )
`define P_RevStart_w( spec )    ( (( spec & `PS_REVERSE ) != 0 ) ? ( ( spec >> `PS_START_STOP_l ) & `PS_START_STOP_MASK ) : 0 )
`define P_RevStop_w( spec )     ( (( spec & `PS_REVERSE ) != 0 ) ? ( ( spec >> `PS_START_STOP_l ) & `PS_START_STOP_MASK ) : 0 )
`define P_RevValid_w( spec )    ( (( spec & `PS_REVERSE ) != 0 ) ? ( 1 ) : 0 )
`define P_RevReady_w( spec )    ( (( spec & `PS_REVERSE ) != 0 ) ? ( 1 ) : 0 )
`define P_Command_w( spec )     ( ( spec >> `PS_COMMAND_l ) & `PS_COMMAND_MASK )
`define P_Result_w( spec )      ( ( spec >> `PS_RESULT_l ) & `PS_RESULT_MASK )
`define P_Request_w( spec )     ( ( spec >> `PS_REQUEST_l ) & `PS_REQUEST_MASK )

// `define P_Data_w( spec )        ( ( spec >> `PS_DATA_l ) & `PS_DATA_MASK )
// `define P_DataSize_w( spec )    ( ( (( spec >> `PS_DATA_SIZE_l ) & `PS_DATA_SIZE_MASK ) != 0 ) ? ($clog2( `P_Data_w( spec ) ) + 1): 0 )
// `define P_Start_w( spec )       ( ( spec >> `PS_START_STOP_l ) & `PS_START_STOP_MASK )
// `define P_Stop_w( spec )        ( ( spec >> `PS_START_STOP_l ) & `PS_START_STOP_MASK )
// `define P_Valid_w( spec )       ( 1 )
// `define P_Ready_w( spec )       ( 1 )
// `define P_RevData_w( spec )     ( (( spec & `PS_REVERSE ) != 0 ) ? ( ( spec >> `PS_DATA_l ) & `PS_DATA_MASK ) : 0 )
// `define P_RevDataSize_w( spec ) ( (( spec & `PS_REVERSE ) != 0 ) ? ( (( ( spec >> `PS_DATA_SIZE_l ) & `PS_DATA_SIZE_MASK ) != 0 ) ? ($clog2( `P_Data_w( spec ) ) + 1): 0 ) : 0 )
// `define P_RevStart_w( spec )    ( (( spec & `PS_REVERSE ) != 0 ) ? ( ( spec >> `PS_START_STOP_l ) & `PS_START_STOP_MASK ) : 0 )
// `define P_RevStop_w( spec )     ( (( spec & `PS_REVERSE ) != 0 ) ? ( ( spec >> `PS_START_STOP_l ) & `PS_START_STOP_MASK ) : 0 )
// `define P_RevValid_w( spec )    ( (( spec & `PS_REVERSE ) != 0 ) ? ( 1 ) : 0 )
// `define P_RevReady_w( spec )    ( (( spec & `PS_REVERSE ) != 0 ) ? ( 1 ) : 0 )
// `define P_Command_w( spec )     ( ( spec >> `PS_COMMAND_l ) & `PS_COMMAND_MASK )
// `define P_Result_w( spec )      ( ( spec >> `PS_RESULT_l ) & `PS_RESULT_MASK )
// `define P_Request_w( spec )     ( ( spec >> `PS_REQUEST_l ) & `PS_REQUEST_MASK )


`define P_Help_Not_Zero( v )  ( ( v == 0 ) ? 1 : v)

// Internal version of the field specs for each field - these record where the field *would* be if it were present
`define P_Data_l(spec)        ( 0 )
`define P_Data_m(spec)        ( `P_Data_l( spec ) + `P_Help_Not_Zero(`P_Data_w( spec )) - 1 )
`define P_Data_mask(spec)     ( ( 1 << `P_Data_w( spec ) ) - 1 )

`define P_DataSize_l(spec)    ( `P_Data_l( spec ) + `P_Data_w( spec ) )
`define P_DataSize_m(spec)    ( `P_DataSize_l( spec ) + `P_Help_Not_Zero(`P_DataSize_w( spec )) - 1 )
`define P_DataSize_mask(spec) ( ( 1 << `P_DataSize_w( spec ) ) - 1 )

`define P_Start_l(spec)       ( `P_DataSize_l( spec ) + `P_DataSize_w( spec ) )
`define P_Start_m(spec)       ( `P_Start_l( spec ) + `P_Help_Not_Zero(`P_Start_w( spec )) - 1 )
`define P_Start_b(spec)       ( `P_Start_l( spec ) )
`define P_Start_mask(spec)    ( ( 1 << `P_Start_w( spec ) ) - 1 )

`define P_Stop_l(spec)        ( `P_Start_l( spec ) + `P_Start_w( spec ) )
`define P_Stop_m(spec)        ( `P_Stop_l( spec ) + `P_Help_Not_Zero(`P_Stop_w( spec )) - 1 )
`define P_Stop_b(spec)        ( `P_Stop_l( spec ) )
`define P_Stop_mask(spec)     ( ( 1 << `P_Stop_w( spec ) ) - 1 )

`define P_Valid_l(spec)       ( `P_Stop_l( spec ) + `P_Stop_w( spec ) )
`define P_Valid_m(spec)       ( `P_Valid_l( spec ) + `P_Help_Not_Zero(`P_Valid_w( spec )) - 1 )
`define P_Valid_b(spec)       ( `P_Valid_l( spec ) )
`define P_Valid_mask(spec)    ( ( 1 << `P_Valid_w( spec ) ) - 1 )

`define P_Ready_l(spec)       ( `P_Valid_l( spec ) + `P_Valid_w( spec ) )
`define P_Ready_m(spec)       ( `P_Ready_l( spec ) + `P_Help_Not_Zero(`P_Ready_w( spec )) - 1 )
`define P_Ready_b(spec)       ( `P_Ready_l( spec )  )
`define P_Ready_mask(spec)    ( ( 1 << `P_Ready_w( spec ) ) - 1 )

`define P_RevData_l(spec)        ( `P_Ready_l( spec ) + `P_Ready_w( spec ) )
`define P_RevData_m(spec)        ( `P_RevData_l( spec ) + `P_Help_Not_Zero(`P_RevData_w( spec )) - 1 )
`define P_RevData_mask(spec)     ( ( 1 << `P_RevData_w( spec ) ) - 1 )

`define P_RevDataSize_l(spec)    ( `P_RevData_l( spec ) + `P_RevData_w( spec ) )
`define P_RevDataSize_m(spec)    ( `P_RevDataSize_l( spec ) + `P_Help_Not_Zero(`P_RevDataSize_w( spec )) - 1 )
`define P_RevDataSize_mask(spec) ( ( 1 << `P_RevDataSize_w( spec ) ) - 1 )

`define P_RevStart_l(spec)       ( `P_RevDataSize_l( spec ) + `P_RevDataSize_w( spec ) )
`define P_RevStart_m(spec)       ( `P_RevStart_l( spec ) + `P_Help_Not_Zero(`P_RevStart_w( spec )) - 1 )
`define P_RevStart_b(spec)       ( `P_RevStart_l( spec ) )
`define P_RevStart_mask(spec)    ( ( 1 << `P_RevStart_w( spec ) ) - 1 )

`define P_RevStop_l(spec)        ( `P_RevStart_l( spec ) + `P_RevStart_w( spec ) )
`define P_RevStop_m(spec)        ( `P_RevStop_l( spec ) + `P_Help_Not_Zero(`P_RevStop_w( spec )) - 1 )
`define P_RevStop_b(spec)        ( `P_RevStop_l( spec ) )
`define P_RevStop_mask(spec)     ( ( 1 << `P_RevStop_w( spec ) ) - 1 )

`define P_RevValid_l(spec)       ( `P_RevStop_l( spec ) + `P_RevStop_w( spec ) )
`define P_RevValid_m(spec)       ( `P_RevValid_l( spec ) + `P_Help_Not_Zero(`P_RevValid_w( spec )) - 1 )
`define P_RevValid_b(spec)       ( `P_RevValid_l( spec ) )
`define P_RevValid_mask(spec)    ( ( 1 << `P_RevValid_w( spec ) ) - 1 )

`define P_RevReady_l(spec)       ( `P_RevValid_l( spec ) + `P_RevValid_w( spec ) )
`define P_RevReady_m(spec)       ( `P_RevReady_l( spec ) + `P_Help_Not_Zero(`P_RevReady_w( spec )) - 1 )
`define P_RevReady_b(spec)       ( `P_RevReady_l( spec )  )
`define P_RevReady_mask(spec)    ( ( 1 << `P_RevReady_w( spec ) ) - 1 )

`define P_Command_l(spec)        ( `P_RevReady_l( spec ) + `P_RevReady_w( spec ) )
`define P_Command_m(spec)        ( `P_Command_l( spec ) + `P_Help_Not_Zero(`P_Command_w( spec )) - 1 )
`define P_Command_mask(spec)     ( ( 1 << `P_Command_w( spec ) ) - 1 )

`define P_Result_l(spec)         ( `P_Command_l( spec ) + `P_Command_w( spec ) )
`define P_Result_m(spec)         ( `P_Result_l( spec ) + `P_Help_Not_Zero(`P_Result_w( spec )) - 1 )
`define P_Result_mask(spec)      ( ( 1 << `P_Result_w( spec ) ) - 1 )

`define P_Request_l(spec)        ( `P_Result_l( spec ) + `P_Result_w( spec ) )
`define P_Request_m(spec)        ( `P_Request_l( spec ) + `P_Help_Not_Zero(`P_Request_w( spec )) - 1 )
`define P_Request_mask(spec)     ( ( 1 << `P_Request_w( spec ) ) - 1 )


// Field specs for each field - these return -1 if the field is not present
// single bit fields are specified with _b, multibit fields are (redundantly) specified with _l, _m, and _w
// `define P_Data_l( spec )     ( ( spec & `PS_DATA ) ? `P_Data_l_( spec ) : -1 )
// `define P_Data_m( spec )     ( ( spec & `PS_DATA ) ? `P_Data_l_( spec ) + `P_Data_w( spec ) -1 : - 1 )
// `define P_Data_wm1( spec )   ( ( spec & `PS_DATA ) ? `P_Data_w( spec ) - 1 : - 1 )
// `define P_DataSize_l( spec ) ( ( spec & `PS_DATA_SIZE ) ? `P_DataSize_l_( spec ) : -1 )
// `define P_DataSize_m( spec ) ( ( spec & `PS_DATA_SIZE ) ? `P_DataSize_l_( spec ) + `P_DataSize_w( spec ) - 1  : -1 )
// `define P_DataSize_wm1( spec )( ( spec & `PS_DATA ) ? `P_DataSize_w( spec ) - 1 : - 1 )
// `define P_Start_b( spec )    ( ( spec & `PS_START_STOP ) ? `P_Start_b_( spec ) : -1 )
// `define P_Stop_b( spec )     ( ( spec & `PS_START_STOP ) ? `P_Stop_b_( spec ) : -1 )
// `define P_Result_b( spec )    ( ( spec & `PS_RESULT ) ? `P_Result_b_( spec ) : -1 )
// `define P_Valid_b( spec )    ( `P_Valid_b_( spec ) )
// `define P_Ready_b( spec )    ( `P_Ready_b_( spec ) )
// // ... Ready must be the last field

// Create a Pipe Spec
`define PS( data_width, data_size, start_stop, reverse, command_width, result_width, request_width ) \
              ( ( ( data_width & `PS_DATA_MASK ) << `PS_DATA_l ) | \
                ( ( data_size & `PS_DATA_SIZE_MASK ) << `PS_DATA_SIZE_l ) | \
                ( ( start_stop & `PS_START_STOP_MASK ) << `PS_START_STOP_l ) | \
                ( ( reverse & `PS_REVERSE_MASK ) << `PS_REVERSE_l ) | \
                ( ( command_width & `PS_COMMAND_MASK ) << `PS_COMMAND_l ) | \
                ( ( result_width & `PS_RESULT_MASK ) << `PS_RESULT_l ) | \
                ( ( request_width & `PS_REQUEST_MASK ) << `PS_REQUEST_l ) \
                )

// Field specs for the whole pipe
// _w needs to include all fields - the _w macros return 0 if the field is not present
// try not to do all the arith again by using the *for sure* last field location + 1 for the total width
`define P_l( spec ) ( 0 )
`define P_w( spec ) ( `P_Data_w(spec) + `P_DataSize_w(spec) + `P_Start_w(spec) + `P_Stop_w(spec) + `P_Valid_w(spec)+ `P_Ready_w(spec) + \
                      `P_RevData_w(spec) + `P_RevDataSize_w(spec) + `P_RevStart_w(spec) + `P_RevStop_w(spec) + `P_RevValid_w(spec)+ `P_RevReady_w(spec) + \
                      `P_Result_w(spec) + `P_Request_w(spec) + `P_Command_w(spec)  )
`define P_wm1( spec ) ( `P_w(spec) - 1 )
`define P_m( spec ) ( `P_w( spec ) - 1 )

// Field specs for the payload as a whole (everthing except the control lines)
`define P_Payload_l( spec )  ( 0 )
`define P_Payload_w( spec )  ( `P_Data_w(spec) + `P_DataSize_w(spec) + `P_Start_w(spec) + `P_Stop_w(spec) )
`define P_Payload_wm1( spec ) ( `P_Payload_w( spec ) - 1 )
`define P_Payload_m( spec )  ( `P_Payload_l( spec ) + `P_Payload_w( spec ) - 1 )

// Quick value getters
`define P_Get_Data( spec, v )  ( ( `P_Data_w( spec ) ? v[ `P_Data_m( spec ) : `P_Data_l( spec ) ] : 0 )
`define P_Get_Ready( spec, v ) ( v[ `P_Ready_b( spec ) ] )
`define P_Get_Valid( spec, v ) ( v[ `P_Valid_b( spec ) ] )
`define P_Get_Start( spec, v ) ( ( `P_Start_w( spec ) ? v[ `P_Start_b( spec ) ] : 0 )
`define P_Get_Stop( spec, v )  ( ( `P_Stop_w( spec ) ? v[ `P_Stop_b( spec ) ] : 0 )

// Some PipeSpec predefs
// - replace these with the PS( ) form

`define PS_d8     ( 8 )
`define PS_d8s    ( 8 | `PS_START_STOP ) // 8 bit data, and start stop signals
`define PS_d8se   ( 8 | `PS_START_STOP | `PS_RESULT ) // 8 bit data, and start stop signals
`define PS_d8sz   ( 8 | `PS_START_STOP | `PS_DATA_SIZE ) // 8 bit data, and data size

`define PS_d16    ( 16 )
`define PS_d16s   ( 16 | `PS_START_STOP ) // 16 bit data, and start stop signals
`define PS_d16se  ( 16 | `PS_START_STOP | `PS_RESULT ) // 16 bit data, and start stop signals
`define PS_d16sz  ( 16 | `PS_START_STOP | `PS_DATA_SIZE ) // 16 bit data, and data size

`define PS_d32    ( 32 ) // 32 bit data onlyw
`define PS_d32s   ( 32 | `PS_START_STOP ) // 32 bit data, and start stop signals
`define PS_d32sz  ( 32 | `PS_START_STOP | `PS_DATA_SIZE ) // 32 bit data, start stop signals and data size

// Default PipeSpec
`define PS_def `PS_d8s

//
// Pipe Spec Check
//

// Rather brutal - yosys doesn't like line numbers `__FILE__, `__LINE__, so it just dies.  At least it says a line number.
// Icarus - is better, but without the line numbers is quite unhelpful

// The Result form below is certainly the preferred way, but currently YOSYS can't parse it, so we're doing a dumb LCD.

// `define PS_MustNotHaveStartStop( spec ) initial begin if ( ( `P_Start_w( spec ) ) || ( `P_Stop_w( spec ) ) ) begin $display( "Spec Must Not Have Start & Stop" ); $finish(); end end
// `define PS_MustHaveStartStop( spec ) initial begin if ( ( `P_Start_w( spec ) == 0 ) || ( `P_Stop_w( spec ) == 0 ) ) begin $display( "Spec Must Have Start & Stop" ); $finish(); end end
// `define PS_MustBeEqual( specA, specB ) initial begin if ( specA != specB ) begin $display( "Specs Must Match 'spec1' %x != 'spec2' %x", specA, specB ); $finish(); end end
// `define PS_MustHaveData( spec ) initial begin if ( `P_Data_w( spec ) == 0 ) begin $display( "Spec Must Have Data" ); $finish(); end end

// one day...
`define PS_MustBeEqual_( specA, specB ) initial begin if ( specA != specB ) begin $error( "Specs Must Match 'spec1' %x != 'spec2' %x", specA, specB ); end end

`define PS_MustHaveStartStop( spec )  generate if ( ( `P_Start_w( spec ) == 0 ) || ( `P_Stop_w( spec ) == 0 ) ) $error( "Spec must have start stop" ); endgenerate

`define PS_MustHaveData( spec )  generate if ( `P_Data_w( spec ) == 0 ) RESULT_PipeSpec_Must_Have_Data(); endgenerate

`define PS_MustHaveDataSize( spec )  generate if ( `P_DataSize_w( spec ) == 0 ) RESULT_PipeSpec_Must_Have_DataSize(); endgenerate

`define PS_ADataMustFitInBData( specA, specB ) generate if ( `P_Data_w( specA ) > `P_Data_w( specB ) ) RESULT_SpecA_Data_Must_Fit_In_SpecB_Data(); endgenerate

`define PS_DataSizeMinimum( spec, size ) generate if ( `P_Data_w( spec ) < size ) RESULT_Data_Too_Small(); endgenerate

`define PS_DataSizeEqual( spec, size ) generate if ( `P_Data_w( spec ) != size ) RESULT_Data_Wrong_Size(); endgenerate

`define PS_MustBeEqual( specA, specB ) generate if ( specA != specB ) RESULT_Specs_Must_Be_Equal(); endgenerate
