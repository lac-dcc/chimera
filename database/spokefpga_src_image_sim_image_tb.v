// This program was cloned from: https://github.com/davidthings/spokefpga
// License: Apache License 2.0

/*

Image Utils

Obv. this is just dumb copied from FP utils.

Testing

*/

`timescale 1ns / 100ps

`include "../../utils/sim/sim.v"

`include "../../image/rtl/image_defs.v"

module image_instance #( parameter IS = 0 )();

    parameter Output=`OutputDebug;

    reg [`I_w( IS )-1:0] pixel;

    reg [`I_w( IS )-1:0] v0;
    reg [`I_w( IS )-1:0] v1;
    reg [`I_w( IS )-1:0] vt;
    reg [`I_w( IS )-1:0] vf;
    integer ps_index;
    integer ps_index_check;
    integer ps_width;
    integer ps_width_check;

    // Using a predefined Spec, confirm that actual values can be read and written
    task test_pipe_values(  inout integer AssertErrorCount, inout integer AssertTestCount );
        begin
            `InfoDo $display( "    Test Pipe Values %x", IS );

            `Info( "        Check Pipe Widths" );

            ps_width = `I_w( IS );
            ps_width_check = `P_w( `IS_PIPE_SPEC( IS ) );
            `AssertEqual( ps_width, ps_width_check, "Overall Width" );

            `InfoDo $display( "            I_w %3d", ps_width );
            `InfoDo $display( "            P_w %3d", ps_width_check );

            pixel = 0;

            ps_index = `I_Data_l( IS );
            ps_index_check = 0;
            `AssertEqual( ps_index, ps_index_check, "Data" );

            ps_width = `I_Start_w( IS );
            `AssertEqual( ps_width, 1, "Start Width" );

            ps_width = `I_Stop_w( IS );
            `AssertEqual( ps_width, 1, "Stop Width" );

            ps_width = `I_Request_w( IS );
            `AssertEqual( ps_width, 1, "Request Width" );

            ps_width = `I_Cancel_w( IS );
            `AssertEqual( ps_width, 1, "Cancel Width" );

            ps_width = `I_Error_w( IS );
            `AssertEqual( ps_width, 1, "Error Width" );

            ps_width = `I_Valid_w( IS );
            `AssertEqual( ps_width, 1, "Valid Width" );

            ps_width = `I_Ready_w( IS );
            `AssertEqual( ps_width, 1, "Ready Width" );

            `Info( "        Check Pipe Read Writes" );

            $display( "            Pre-Diddling     %b", pixel );

            v0 = pixel[ `I_Data_m( IS ) : `I_Data_l( IS ) ];
            `AssertEqual( v0, 0, "Data Initial 0 Value" );
            vt = (1<<`I_Data_w( IS ))-1;
            pixel[ `I_Data_m( IS ) : `I_Data_l( IS ) ] = v0 ^ vt;
            v1 = pixel[ `I_Data_m( IS ) : `I_Data_l( IS ) ];
            `Assert( v0 != v1, "Change Data" );
            `AssertEqual( v1, vt, "Data Post Full Load" );
            vf = `I_Data( IS, pixel );
            `AssertEqual( vf, vt, "Data Accessor" );

            $display( "            Diddling Data    %b  m %2d l %2d", pixel, `I_Data_m( IS ), `I_Data_l( IS ) );

            // $display( "                 V0 %b", v0 );
            // $display( "                 VT %b", vt );
            // $display( "                 V1 %b", v1 );

            v0 = pixel[ `I_Start_m( IS ) : `I_Start_l( IS ) ];
            `AssertEqual( v0, 0, "Start Initial 0 Value" );
            vt = 1;
            pixel[ `I_Start_m( IS ) : `I_Start_l( IS ) ] = v0 ^ vt;
            v1 = pixel[ `I_Start_m( IS ) : `I_Start_l( IS ) ];
            `Assert( v0 != v1, "Change Start" );
            `AssertEqual( v1, vt, "Start Post Full Load" );
            vf = `I_Start( IS, pixel);
            `AssertEqual( vf, vt, "Start Accessor" );

            // $display( "                 V0 %b", v0 );
            // $display( "                 VT %b", vt );
            // $display( "                 V1 %b", v1 );

            $display( "            Diddling Start   %b  m %2d l %2d", pixel, `I_Start_m( IS ), `I_Start_l( IS ) );

            v0 = pixel[ `I_Stop_m( IS ) : `I_Stop_l( IS ) ];
            `AssertEqual( v0, 0, "Stop Initial 0 Value" );
            vt = 1;
            pixel[ `I_Stop_m( IS ) : `I_Stop_l( IS ) ] = v0 ^ vt;
            v1 = pixel[ `I_Stop_m( IS ) : `I_Stop_l( IS ) ];
            `Assert( v0 != v1, "Change Stop" );
            `AssertEqual( v1, vt, "Stop Post Full Load" );
            vf = `I_Stop( IS, pixel);
            `AssertEqual( vf, vt, "Stop Accessor" );

            $display( "            Diddling Stop    %b  m %2d l %2d", pixel, `I_Stop_m( IS ), `I_Stop_l( IS ) );

            v0 = pixel[ `I_Valid_m( IS ) : `I_Valid_l( IS ) ];
            `AssertEqual( v0, 0, "Valid Initial 0 Value" );
            vt = 1;
            pixel[ `I_Valid_m( IS ) : `I_Valid_l( IS ) ] = v0 ^ vt;
            v1 = pixel[ `I_Valid_m( IS ) : `I_Valid_l( IS ) ];
            `Assert( v0 != v1, "Change Valid" );
            `AssertEqual( v1, vt, "Valid Post Full Load" );
            vf = `I_Valid( IS, pixel);
            `AssertEqual( vf, vt, "Valid Accessor" );
            $display( "            Diddling Valid   %b  m %2d l %2d", pixel, `I_Valid_m( IS ), `I_Valid_l( IS ) );

            // $display( "                 V0 %b", v0 );
            // $display( "                 VT %b", vt );
            // $display( "                 V1 %b", v1 );


            v0 = pixel[ `I_Ready_m( IS ) : `I_Ready_l( IS ) ];
            `AssertEqual( v0, 0, "Ready Initial 0 Value" );
            vt = 1;
            pixel[ `I_Ready_m( IS ) : `I_Ready_l( IS ) ] = v0 ^ vt;
            v1 = pixel[ `I_Ready_m( IS ) : `I_Ready_l( IS ) ];
            `Assert( v0 != v1, "Change Ready" );
            `AssertEqual( v1, vt, "Ready Post Full Load" );
            vf = `I_Ready( IS, pixel);
            `AssertEqual( vf, vt, "Ready Accessor" );

            $display( "            Diddling Ready   %b  m %2d l %2d", pixel, `I_Ready_m( IS ), `I_Ready_l( IS ) );

            // $display( "                 V0 %b", v0 );
            // $display( "                 VT %b", vt );
            // $display( "                 V1 %b", v1 );


            v0 = pixel[ `I_Error_m( IS ) : `I_Error_l( IS ) ];
            `AssertEqual( v0, 0, "Error Initial 0 Value" );
            vt = 1;
            pixel[ `I_Error_m( IS ) : `I_Error_l( IS ) ] = v0 ^ vt;
            v1 = pixel[ `I_Error_m( IS ) : `I_Error_l( IS ) ];
            `Assert( v0 != v1, "Change Error" );
            `AssertEqual( v1, vt, "Error Post Full Load" );
            vf = `I_Error( IS, pixel);
            `AssertEqual( vf, vt, "Error Accessor" );
            $display( "            Diddling Error   %b  m %2d l %2d", pixel, `I_Error_m( IS ), `I_Error_l( IS ) );

            v0 = pixel[ `I_Cancel_m( IS ) : `I_Cancel_l( IS ) ];
            `AssertEqual( v0, 0, "Cancel Initial 0 Value" );
            vt = 1;
            pixel[ `I_Cancel_m( IS ) : `I_Cancel_l( IS ) ] = v0 ^ vt;
            v1 = pixel[ `I_Cancel_m( IS ) : `I_Cancel_l( IS ) ];
            `Assert( v0 != v1, "Change Cancel" );
            `AssertEqual( v1, vt, "Cancel Post Full Load" );
            vf = `I_Cancel( IS, pixel);
            `AssertEqual( vf, vt, "Cancel Accessor" );
            $display( "            Diddling Cancel  %b  m %2d l %2d", pixel, `I_Cancel_m( IS ), `I_Cancel_l( IS ) );

            v0 = pixel[ `I_Request_m( IS ) : `I_Request_l( IS ) ];
            `AssertEqual( v0, 0, "Request Initial 0 Value" );
            vt = 1;
            pixel[ `I_Request_m( IS ) : `I_Request_l( IS ) ] = v0 ^ vt;
            v1 = pixel[ `I_Request_m( IS ) : `I_Request_l( IS ) ];
            `Assert( v0 != v1, "Change Request" );
            `AssertEqual( v1, vt, "Request Post Full Load" );
            vf = `I_Request( IS, pixel);
            `AssertEqual( vf, vt, "Request Accessor" );
            $display( "            Diddling Request %b  m %2d l %2d", pixel, `I_Request_m( IS ), `I_Request_l( IS ) );

/*
*/
            pixel = 0;

        end
    endtask

    integer i;

    integer i_data_width;
    integer i_plane_width;
    integer i_width;
    integer i_width_check;

    // Using a predefined Spec, confirm that actual values can be read and written
    task test_image_values(  inout integer AssertErrorCount, inout integer AssertTestCount );
        begin
            `InfoDo $display( "    Test Image Values %x", IS );

            `Info( "        Check Image Widths" );

            i_data_width = `I_Data_w( IS );
            i_plane_width = `I_Plane_w( IS );
            i_width = i_plane_width * `IS_PLANES( IS );
            `AssertEqual( i_width, i_data_width, "Data Width" );
            `InfoDo $display( "            Data Width     %d", i_width  );

            i_width = `I_C0_w( IS );
            i_width_check = `IS_C0_WIDTH( IS );
            `AssertEqual( i_width, i_width_check, "C0" );
            `InfoDo $display( "            C0 Width       %d", i_width  );

            i_width = `I_C1_w( IS );
            i_width_check = `IS_C1_WIDTH( IS );
            `AssertEqual( i_width, i_width_check, "C1" );
            `InfoDo $display( "            C1 Width       %d", i_width  );

            i_width = `I_C2_w( IS );
            i_width_check = `IS_C2_WIDTH( IS );
            `AssertEqual( i_width, i_width_check, "C2" );
            `InfoDo $display( "            C2 Width       %d", i_width  );

            i_width = `I_Alpha_w( IS );
            i_width_check = `IS_ALPHA_WIDTH( IS );
            `AssertEqual( i_width, i_width_check, "Alpha" );
            `InfoDo $display( "            Alpha Width    %d", i_width  );

            i_width = `I_Z_w( IS );
            i_width_check = `IS_Z_WIDTH( IS );
            `AssertEqual( i_width, i_width_check, "Z" );
            `InfoDo $display( "            Z Width        %d", i_width  );

            `Info( "        Check Image Read Writes" );

            pixel = 0;

            `Info( "            Default Plane 0" );
            if ( `I_C0_w( IS ) > 0 ) begin
                v0 = pixel[ `I_C0_m( IS, 0 ) : `I_C0_l( IS, 0 ) ];
                `AssertEqual( v0, 0, "C0 Initial 0 Value" );
                vt = ( ( 1 << (`I_C0_w( IS )) ) - 1 );
                pixel[ `I_C0_m( IS, 0 ) : `I_C0_l( IS, 0 ) ] = v0 ^ vt;
                v1 = pixel[ `I_C0_m( IS, 0 ) : `I_C0_l( IS, 0 ) ];
                `AssertEqual( v1, vt, "C0 Post Full Load" );
                vf = `I_C0( IS, pixel );
                `AssertEqual( vf, vt, "C0 Accessor" );
                $display( "            Diddling C0      %b  m %2d l %2d", pixel, `I_C0_m( IS, 0 ), `I_C0_l( IS, 0 ) );
            end

            if ( `I_C1_w( IS ) > 0 ) begin
                v0 = pixel[ `I_C1_m( IS, 0 ) : `I_C1_l( IS, 0 ) ];
                `AssertEqual( v0, 0, "C1 Initial 0 Value" );
                vt = ( ( 1 << (`I_C1_w( IS )) ) - 1 );
                pixel[ `I_C1_m( IS, 0 ) : `I_C1_l( IS, 0 ) ] = v0 ^ vt;
                v1 = pixel[ `I_C1_m( IS, 0 ) : `I_C1_l( IS, 0 ) ];
                `AssertEqual( v1, vt, "C1 Post Full Load" );
                vf = `I_C1( IS, pixel );
                `AssertEqual( vf, vt, "C1 Accessor" );
                $display( "            Diddling C1      %b  m %2d l %2d", pixel, `I_C1_m( IS, 0 ), `I_C1_l( IS, 0 ) );
            end

            if ( `I_C2_w( IS ) > 0 ) begin
                v0 = pixel[ `I_C2_m( IS, 0 ) : `I_C2_l( IS, 0 ) ];
                `AssertEqual( v0, 0, "C2 Initial 0 Value" );
                vt = ( ( 1 << (`I_C2_w( IS )) ) - 1 );
                pixel[ `I_C2_m( IS, 0 ) : `I_C2_l( IS, 0 ) ] = v0 ^ vt;
                v1 = pixel[ `I_C2_m( IS, 0 ) : `I_C2_l( IS, 0 ) ];
                `AssertEqual( v1, vt, "C2 Post Full Load" );
                vf = `I_C2( IS, pixel );
                `AssertEqual( vf, vt, "C2 Accessor" );
                $display( "            Diddling C2      %b  m %2d l %2d", pixel, `I_C2_m( IS, 0 ), `I_C2_l( IS, 0 ) );
            end

            if ( `I_Alpha_w( IS ) > 0 ) begin
                v0 = pixel[ `I_Alpha_m( IS, 0 ) : `I_Alpha_l( IS, 0 ) ];
                `AssertEqual( v0, 0, "Alpha Initial 0 Value" );
                vt = ( ( 1 << (`I_Alpha_w( IS )) ) - 1 );
                pixel[ `I_Alpha_m( IS, 0 ) : `I_Alpha_l( IS, 0 ) ] = v0 ^ vt;
                v1 = pixel[ `I_Alpha_m( IS, 0 ) : `I_Alpha_l( IS, 0 ) ];
                `AssertEqual( v1, vt, "Alpha Post Full Load" );
                vf = `I_Alpha( IS, pixel );
                `AssertEqual( vf, vt, "Alpha Accessor" );
                $display( "            Diddling Alpha   %b  m %2d l %2d", pixel, `I_Alpha_m( IS, 0 ), `I_Alpha_l( IS, 0 ) );
            end

            if ( `I_Z_w( IS ) > 0 ) begin
                v0 = pixel[ `I_Z_m( IS, 0 ) : `I_Z_l( IS, 0 ) ];
                `AssertEqual( v0, 0, "Z Initial 0 Value" );
                vt = ( ( 1 << (`I_Z_w( IS )) ) - 1 );
                pixel[ `I_Z_m( IS, 0 ) : `I_Z_l( IS, 0 ) ] = v0 ^ vt;
                v1 = pixel[ `I_Z_m( IS, 0 ) : `I_Z_l( IS, 0 ) ];
                `AssertEqual( v1, vt, "Z Post Full Load" );
                vf = `I_Z( IS, pixel );
                `AssertEqual( vf, vt, "Z Accessor" );
                $display( "            Diddling Z       %b  m %2d l %2d", pixel, `I_Z_m( IS, 0 ), `I_Z_l( IS, 0 ) );
            end

            if ( `IS_PLANES( IS ) > 1 ) begin

                `Info( "            Trial Test Plane 1" );

                if ( `I_C0_w( IS ) > 0 ) begin
                    v0 = pixel[ `I_C0_m( IS, 1 ) : `I_C0_l( IS, 1 ) ];
                    `AssertEqual( v0, 0, "C0 Initial 0 Value" );
                    vt = ( ( 1 << (`I_C0_w( IS )) ) - 1 );
                    pixel[ `I_C0_m( IS, 1 ) : `I_C0_l( IS, 1 ) ] = v0 ^ vt;
                    v1 = pixel[ `I_C0_m( IS, 1 ) : `I_C0_l( IS, 1 ) ];
                    `AssertEqual( v1, vt, "C0 Post Full Load" );
                    vf = `I_C0_p( IS, pixel, 1  );
                    `AssertEqual( vf, vt, "C0 Accessor" );
                    $display( "            Diddling C0.1    %b  m %2d l %2d", pixel, `I_C0_m( IS, 1 ), `I_C0_l( IS, 1 ) );
                end

                if ( `I_C1_w( IS ) > 0 ) begin
                    v0 = pixel[ `I_C1_m( IS, 1 ) : `I_C1_l( IS, 1 ) ];
                    `AssertEqual( v0, 0, "C1 Initial 0 Value" );
                    vt = ( ( 1 << (`I_C1_w( IS )) ) - 1 );
                    pixel[ `I_C1_m( IS, 1 ) : `I_C1_l( IS, 1 ) ] = v0 ^ vt;
                    v1 = pixel[ `I_C1_m( IS, 1 ) : `I_C1_l( IS, 1 ) ];
                    `AssertEqual( v1, vt, "C1 Post Full Load" );
                    vf = `I_C1_p( IS, pixel, 1 );
                    `AssertEqual( vf, vt, "C1 Accessor" );
                    $display( "            Diddling C1.1    %b  m %2d l %2d", pixel, `I_C1_m( IS, 1 ), `I_C1_l( IS, 1 ) );
                end

                if ( `I_C2_w( IS ) > 0 ) begin
                    v0 = pixel[ `I_C2_m( IS, 1 ) : `I_C2_l( IS, 1 ) ];
                    `AssertEqual( v0, 0, "C2 Initial 0 Value" );
                    vt = ( ( 1 << (`I_C2_w( IS )) ) - 1 );
                    pixel[ `I_C2_m( IS, 1 ) : `I_C2_l( IS, 1 ) ] = v0 ^ vt;
                    v1 = pixel[ `I_C2_m( IS, 1 ) : `I_C2_l( IS, 1 ) ];
                    `AssertEqual( v1, vt, "C2 Post Full Load" );
                    vf = `I_C2_p( IS, pixel, 1 );
                    `AssertEqual( vf, vt, "C2 Accessor" );
                    $display( "            Diddling C0.2    %b  m %2d l %2d", pixel, `I_C2_m( IS, 1 ), `I_C2_l( IS, 1 ) );
                end

                if ( `I_Alpha_w( IS ) > 0 ) begin
                    v0 = pixel[ `I_Alpha_m( IS, 1 ) : `I_Alpha_l( IS, 1 ) ];
                    `AssertEqual( v0, 0, "Alpha Initial 0 Value" );
                    vt = ( ( 1 << (`I_Alpha_w( IS )) ) - 1 );
                    pixel[ `I_Alpha_m( IS, 1 ) : `I_Alpha_l( IS, 1 ) ] = v0 ^ vt;
                    v1 = pixel[ `I_Alpha_m( IS, 1 ) : `I_Alpha_l( IS, 1 ) ];
                    `AssertEqual( v1, vt, "Alpha Post Full Load" );
                    vf = `I_Alpha_p( IS, pixel, 1 );
                    `AssertEqual( vf, vt, "Alpha Accessor" );
                    $display( "            Diddling Alpha.2 %b  m %2d l %2d", pixel, `I_Alpha_m( IS, 1 ), `I_Alpha_l( IS, 1 ) );
                end

                if ( `I_Z_w( IS ) > 0 ) begin
                    v0 = pixel[ `I_Z_m( IS, 1 ) : `I_Z_l( IS, 1 ) ];
                    `AssertEqual( v0, 0, "Z Initial 0 Value" );
                    vt = ( ( 1 << (`I_Z_w( IS )) ) - 1 );
                    pixel[ `I_Z_m( IS, 1 ) : `I_Z_l( IS, 1 ) ] = v0 ^ vt;
                    v1 = pixel[ `I_Z_m( IS, 1 ) : `I_Z_l( IS, 1 ) ];
                    `AssertEqual( v1, vt, "Z Post Full Load" );
                    vf = `I_Z_p( IS, pixel, 1 );
                    `AssertEqual( vf, vt, "Z Accessor" );
                    $display( "            Diddling Z.2     %b  m %2d l %2d", pixel, `I_Z_m( IS, 1 ), `I_Z_l( IS, 1 ) );
                end

            end
/*
*/

        end
    endtask

endmodule

module image_tb();

    parameter Output=`OutputDebug;
    // parameter Output=`OutputInfo;
    // parameter Output=`OutputError;

    reg  reset;

    initial begin
      $dumpfile("image_tb.vcd");
      $dumpvars( 0, image_tb );
    end

    // create the realtime_ns counter
    `Realtime

    // create the 10MHz clock
    `Clock10MHz

    `AssertSetup

    task i_init;
        begin
        end
    endtask

    task  i_clock;
        begin
            #2
            @( posedge clock );
            // `Info( "    Clock");
            #2
            ;
        end
    endtask

    task  i_reset;
        begin
            reset = 1;
            i_clock;
            `Info( "    Reset");
            reset = 0;
            i_clock;
        end
    endtask

    reg [(`IS_w)-1:0] is;

    integer is_test_width;
    integer is_test_width_direct;
    integer is_test_plane_width;
    integer is_test_plane_width_direct;
    integer is_test_plane_data;
    integer is_test_plane_data_direct;

    integer is_x_width;
    integer is_y_width;
    integer is_x_width_check;
    integer is_y_width_check;

    integer is_pixel_count;
    integer is_pixel_count_check;

    // Build a spec up from parts and check that the accessor, etc macros work
    task i_spec_check( input integer x, input integer y, input integer w, input integer h, input integer d,
                       input integer p, input integer f,
                       input integer c0w, input integer c1w, input integer c2w, input integer aw, input integer zw );
        begin
            `InfoDo $display( "    Spec Check "  );
            `InfoDo $display( "        X %-0d Y %-0d", x, y );
            `InfoDo $display( "        W %-0d H %-0d D %-0d", w, h, d  );
            `InfoDo $display( "        P %-0d F %-0d", p, f  );
            `InfoDo $display( "        C0 %-2d C1 %-2d C2 %-2d A %-2d Z %-2d", c0w, c1w, c2w, aw, zw  );

            `InfoDo $display( "        IS_w           %-d", `IS_w );

            is_test_width = ( `IS_X_BITS + `IS_Y_BITS + `IS_WIDTH_BITS + `IS_HEIGHT_BITS + `IS_DEPTH_BITS +
                             `IS_PLANES_BITS + `IS_FORMAT_BITS +
                             `IS_C0_WIDTH_BITS + `IS_C1_WIDTH_BITS + `IS_C2_WIDTH_BITS + `IS_ALPHA_WIDTH_BITS + `IS_Z_WIDTH_BITS );

            is_test_width_direct = `IS_w;

            `AssertEqual( is_test_width, is_test_width_direct, "" );

            is = `IS( x, y, w, h, d, p, f, c0w, c1w, c2w, aw, zw );

            `InfoDo $display( "        IS             %x", is );

            `AssertEqual( x,   `IS_X( is ), "Read back" );
            `AssertEqual( y,   `IS_Y( is ), "Read back" );
            `AssertEqual( w,   `IS_WIDTH( is ), "Read back" );
            `AssertEqual( h,   `IS_HEIGHT( is ), "Read back" );
            `AssertEqual( d,   `IS_DEPTH( is ), "Read back" );
            `AssertEqual( p,   `IS_PLANES( is ), "Read back" );
            `AssertEqual( f,   `IS_FORMAT( is ), "Read back" );
            `AssertEqual( c0w, `IS_C0_WIDTH( is ), "Read back" );
            `AssertEqual( c1w, `IS_C1_WIDTH( is ), "Read back" );
            `AssertEqual( c2w, `IS_C2_WIDTH( is ), "Read back" );
            `AssertEqual( aw,  `IS_ALPHA_WIDTH( is ), "Read back" );
            `AssertEqual( zw,  `IS_Z_WIDTH( is ), "Read back" );

            is = ( `IS_X_SET( x ) | `IS_Y_SET( y ) | `IS_WIDTH_SET( w ) | `IS_HEIGHT_SET( h ) | `IS_DEPTH_SET( d ) |
                   `IS_PLANES_SET( p ) | `IS_FORMAT_SET( f ) |
                   `IS_C0_WIDTH_SET( c0w ) | `IS_C1_WIDTH_SET( c1w ) | `IS_C2_WIDTH_SET( c2w ) |
                   `IS_ALPHA_WIDTH_SET( aw ) | `IS_Z_WIDTH_SET( zw  ) );

            `AssertEqual( x,   `IS_X( is ), "Read back" );
            `AssertEqual( y,   `IS_Y( is ), "Read back" );
            `AssertEqual( w,   `IS_WIDTH( is ), "Read back" );
            `AssertEqual( h,   `IS_HEIGHT( is ), "Read back" );
            `AssertEqual( d,   `IS_DEPTH( is ), "Read back" );
            `AssertEqual( p,   `IS_PLANES( is ), "Read back" );
            `AssertEqual( f,   `IS_FORMAT( is ), "Read back" );
            `AssertEqual( c0w, `IS_C0_WIDTH( is ), "Read back" );
            `AssertEqual( c1w, `IS_C1_WIDTH( is ), "Read back" );
            `AssertEqual( c2w, `IS_C2_WIDTH( is ), "Read back" );
            `AssertEqual( aw,  `IS_ALPHA_WIDTH( is ), "Read back" );
            `AssertEqual( zw,  `IS_Z_WIDTH( is ), "Read back" );

            is_test_plane_width = `IS_PLANE_WIDTH( is );
            is_test_plane_width_direct = c0w + c1w + c2w + aw + zw;
            `AssertEqual( is_test_plane_width, is_test_plane_width_direct, "Plane Width" );

            `InfoDo $display( "        IS_PLANE_WIDTH %-d", is_test_plane_width );

            is_test_plane_data = `IS_DATA_WIDTH( is );
            is_test_plane_data_direct = is_test_plane_width_direct * p;

            `InfoDo $display( "        IS_DATA_WIDTH  %-d", is_test_plane_data );

            `AssertEqual( is_test_plane_data, is_test_plane_data_direct, "Data Width"  );

            is_x_width = `IS_WIDTH_WIDTH( is );
            is_x_width_check = $clog2( `IS_WIDTH( is ) );

            `AssertEqual( is_x_width, is_x_width_check, "X Width" );

            is_y_width = `IS_HEIGHT_WIDTH( is );
            is_y_width_check = $clog2( `IS_HEIGHT( is ) + 1 );

            `AssertEqual( is_y_width, is_y_width_check, "Y Width" );

            `InfoDo $display( "        Co-ordinate Widths (%2d,%2d)", is_x_width, is_y_width );

            is_pixel_count = `IS_PIXEL_COUNT( is );
            is_pixel_count_check = w * h;

            `AssertEqual( is_pixel_count, is_pixel_count_check, "Pixel Count" );

            `InfoDo $display( "        Pixel Count %-d", is_pixel_count );

            `InfoDo $display( "        Check Masks" );

            `Assert( `IS_X_MASK, "X Mask" );
            `Assert( `IS_Y_MASK, "Y Mask" );
            `Assert( `IS_WIDTH_MASK, "WIDTH Mask" );
            `Assert( `IS_HEIGHT_MASK, "HEIGHT Mask" );
            `Assert( `IS_DEPTH_MASK, "DEPTH Mask" );
            `Assert( `IS_PLANES_MASK, "PLANES Mask" );
            `Assert( `IS_FORMAT_MASK, "FORMAT Mask" );
            `Assert( `IS_C0_WIDTH_MASK, "C0_WIDTH Mask" );
            `Assert( `IS_C1_WIDTH_MASK, "C1_WIDTH Mask" );
            `Assert( `IS_C2_WIDTH_MASK, "C2_WIDTH Mask" );
            `Assert( `IS_ALPHA_WIDTH_MASK, "ALPHA_WIDTH Mask" );
            `Assert( `IS_Z_WIDTH_MASK, "Z_WIDTH Mask" );

            w = `I_Data_w( is );
            l = `I_Data_l( is );
            m = `I_Data_m( is );
            l_check = 0;
            m_check = l_check + w - 1;
            `AssertEqual( l, l_check, "Data_l" );
            `AssertEqual( m, m_check, "Data_m" );
            `InfoDo $display( "        Data   [%3d:%3d] (%3d)", m, l, w );

            w = `I_C0_w( is );
            l = `I_C0_l( is, 0 );
            m = `I_C0_m( is, 0 );
            l_check = 0;
            m_check = l_check + ( ( w == 0 ) ? 0 : w - 1 );
            `AssertEqual( l, l_check, "C0_l" );
            `AssertEqual( m, m_check, "C0_m" );
            `InfoDo $display( "        C0     [%3d:%3d] (%3d)", m, l, w );

            w = `I_C1_w( is );
            l = `I_C1_l( is, 0 );
            m = `I_C1_m( is, 0 );
            l_check = `I_C0_l( is, 0 ) + `I_C0_w( is );
            m_check = l_check + (( w == 0 ) ? 0 : (w - 1) );
            `AssertEqual( l, l_check, "C1_l" );
            `AssertEqual( m, m_check, "C1_m" );
            `InfoDo $display( "        C1     [%3d:%3d] (%3d)", m, l, w );

            w = `I_C2_w( is );
            l = `I_C2_l( is, 0 );
            m = `I_C2_m( is, 0 );
            l_check = `I_C1_l( is, 0 ) + `I_C1_w( is );
            m_check = l_check + (( w == 0 ) ? 0 : (w - 1) );
            `AssertEqual( l, l_check, "C2_l" );
            `AssertEqual( m, m_check, "C2_m" );
            `InfoDo $display( "        C2     [%3d:%3d] (%3d)", m, l, w );

            w = `I_Alpha_w( is );
            l = `I_Alpha_l( is, 0 );
            m = `I_Alpha_m( is, 0 );
            l_check = `I_C2_l( is, 0 ) + `I_C2_w( is );
            m_check = l_check + (( w == 0 ) ? 0 : (w - 1) );
            `AssertEqual( l, l_check, "Alpha_l" );
            `AssertEqual( m, m_check, "Alpha_m" );
            `InfoDo $display( "        Alpha  [%3d:%3d] (%3d)", m, l, w );

            w = `I_Z_w( is );
            l = `I_Z_l( is, 0 );
            m = `I_Z_m( is, 0 );
            l_check = `I_Alpha_l( is, 0 ) + `I_Alpha_w( is );
            m_check = l_check + (( w == 0 ) ? 0 : (w - 1) );
            `AssertEqual( l, l_check, "Z_l" );
            `AssertEqual( m, m_check, "Z_m" );
            `InfoDo $display( "        Z      [%3d:%3d] (%3d)", m, l, w );

            w = `I_Start_w( is );
            l = `I_Start_l( is );
            m = `I_Start_m( is );
            l_check = `I_Data_l( is ) + `I_Data_w( is );
            m_check = l_check + (( w == 0 ) ? 0 : (w - 1) );
            `AssertEqual( l, l_check, "Start_l" );
            `AssertEqual( m, m_check, "Start_m" );
            `InfoDo $display( "        Start  [%3d:%3d] (%3d)", m, l, w );

            w = `I_Stop_w( is );
            l = `I_Stop_l( is );
            m = `I_Stop_m( is );
            l_check = `I_Start_l( is ) + `I_Start_w( is );
            m_check = l_check + (( w == 0 ) ? 0 : (w - 1) );
            `AssertEqual( l, l_check, "Stop_l" );
            `AssertEqual( m, m_check, "Stop_m" );
            `InfoDo $display( "        Stop   [%3d:%3d] (%3d)", m, l, w );

            w = `I_Valid_w( is );
            l = `I_Valid_l( is );
            m = `I_Valid_m( is );
            l_check = `I_Stop_l( is ) + `I_Stop_w( is );
            m_check = l_check + (( w == 0 ) ? 0 : (w - 1) );
            `AssertEqual( l, l_check, "Valid_l" );
            `AssertEqual( m, m_check, "Valid_m" );
            `InfoDo $display( "        Valid  [%3d:%3d] (%3d)", m, l, w );

            w = `I_Ready_w( is );
            l = `I_Ready_l( is );
            m = `I_Ready_m( is );
            l_check = `I_Valid_l( is ) + `I_Valid_w( is );
            m_check = l_check + (( w == 0 ) ? 0 : (w - 1) );
            `AssertEqual( l, l_check, "Ready_l" );
            `AssertEqual( m, m_check, "Ready_m" );
            `InfoDo $display( "        Ready  [%3d:%3d] (%3d)", m, l, w );


        end
    endtask

    integer ps;
    integer ps_check;
    integer ps_value;
    integer ps_value_check;

    integer l;
    integer l_check;
    integer m;
    integer m_check;
    integer w;

    task i_pipe_spec_check( input integer x, input integer y, input integer w, input integer h, input integer d,
                            input integer p, input integer f,
                            input integer c0w, input integer c1w, input integer c2w, input integer aw, input integer zw );
        begin
            `InfoDo $display( "    Spec Pipe Check ");
            `InfoDo $display( "        X %-0d Y %-0d W", x, y );
            `InfoDo $display( "        W %-0d H %-0d D %-0d", w, h, d  );
            `InfoDo $display( "        P %-0d F %-0d", p, f  );
            `InfoDo $display( "        C0 %-2d C1 %-2d C2 %-2d A %-2d Z %-2d", c0w, c1w, c2w, aw, zw  );

            `InfoDo $display( "        IS_w %-d", `IS_w );

            is = `IS( x, y, w, h, d, p, f, c0w, c1w, c2w, aw, zw );

            ps = `IS_PIPE_SPEC( is );

            ps_check = `PS_DATA( `IS_DATA_WIDTH( is ) ) | `PS_START_STOP | `PS_COMMAND( 1 ) | `PS_REQUEST( 1  ) | `PS_RESULT( 1 );

            `InfoDo $display( "        PS  %-x", ps );

            `AssertEqual( ps, ps_check, "PipeSpecs" );

            ps_value = `P_Data_w( ps );
            // ps_value = `PS_DATA( ps );
            ps_value_check = `IS_DATA_WIDTH( is );
            `InfoDo $display( "        PS  DATA WIDTH %-d", ps_value );
            `AssertEqual( ps_value, ps_value_check, "Data Width" );

            `AssertEqual( `P_Start_w( ps ), 1, "Start" );
            `AssertEqual( `P_Stop_w( ps ), 1, "Stop" );
            `AssertEqual( `P_RevData_w( ps ), 0, "RevData" );
            `AssertEqual( `P_Command_w( ps ), 1, "Command" );
            `AssertEqual( `P_Request_w( ps ), 1, "Request" );
            `AssertEqual( `P_Result_w( ps ), 1, "Result" );
            `AssertEqual( `P_Valid_w( ps ), 1, "Valid" );
            `AssertEqual( `P_Ready_w( ps ), 1, "Ready" );

            w = `P_Data_w( ps );
            l = `P_Data_l( ps );
            m = `P_Data_m( ps );
            l_check = 0;
            m_check = l_check + w - 1;
            `AssertEqual( l, l_check, "Data_l" );
            `AssertEqual( m, m_check, "Data_m" );
            `InfoDo $display( "        Data   [%3d:%3d] (%3d)", l, m, w );

            w = `P_Start_w( ps );
            l = `P_Start_l( ps );
            m = `P_Start_m( ps );
            l_check = `P_Data_l( ps ) + `P_Data_w( ps );
            m_check = l_check + w - 1;
            `AssertEqual( l, l_check, "Start_l" );
            `AssertEqual( m, m_check, "Start_m" );
            `InfoDo $display( "        Start  [%3d:%3d] (%3d)", l, m, w );

            w = `P_Stop_w( ps );
            l = `P_Stop_l( ps );
            m = `P_Stop_m( ps );
            l_check = `P_Start_l( ps ) + `P_Start_w( ps );
            m_check = l_check + w - 1;
            `AssertEqual( l, l_check, "Stop_l" );
            `AssertEqual( m, m_check, "Stop_m" );
            `InfoDo $display( "        Stop   [%3d:%3d] (%3d)", l, m, w );

            w = `P_Valid_w( ps );
            l = `P_Valid_l( ps );
            m = `P_Valid_m( ps );
            l_check = `P_Stop_l( ps ) + `P_Stop_w( ps );
            m_check = l_check + w - 1;
            `AssertEqual( l, l_check, "Valid_l" );
            `AssertEqual( m, m_check, "Valid_m" );
            `InfoDo $display( "        Valid  [%3d:%3d] (%3d)", l, m, w );


            w = `P_Ready_w( ps );
            l = `P_Ready_l( ps );
            m = `P_Ready_m( ps );
            l_check = `P_Valid_l( ps ) + `P_Valid_w( ps );
            m_check = l_check + w - 1;
            `AssertEqual( l, l_check, "Ready_l" );
            `AssertEqual( m, m_check, "Ready_m" );
            `InfoDo $display( "        Ready  [%3d:%3d] (%3d)", l, m, w );

        end
    endtask

    localparam [`IS_w-1:0] IS_1 = `IS( 0, 0, 480, 320, 0, 1, `IS_FORMAT_RGB, 8, 8, 8, 0, 0 );
    localparam [`IS_w-1:0] IS_2 = `IS( 0, 0, 480, 320, 0, 2, `IS_FORMAT_RGB, 8, 8, 8, 8, 8 );
    localparam [`IS_w-1:0] IS_3 = `IS( 0, 0, 10, 10, 0, 1,   `IS_FORMAT_GRAYSCALE, 32, 0, 0, 0, 0 );
    localparam [`IS_w-1:0] IS_4 = `IS( 0, 0, 10, 10, 0, 1,   `IS_FORMAT_GRAYSCALE, 1, 0, 0, 0, 0 );
    localparam [`IS_w-1:0] IS_5 = `IS( 0, 0, 480, 320, 0, 1, `IS_FORMAT_RGB, 5, 6, 5, 0, 0 );
    localparam [`IS_w-1:0] IS_6 = `IS( 10, 10, 200, 200, 0, 1, `IS_FORMAT_RGB, 5, 6, 5, 0, 0 );

    image_instance #(.IS(IS_1) ) i1();
    image_instance #(.IS(IS_2) ) i2();
    image_instance #(.IS(IS_3) ) i3();
    image_instance #(.IS(IS_4) ) i4();
    image_instance #(.IS(IS_5) ) i5();
    image_instance #(.IS(IS_6) ) i6();

    initial begin
        $display( "Image Tests %s", `__FILE__ );

        i_init;
        i_reset;

        // Test the Spec helpers ( X, Y, W, H, D, P, F, C0W, C1W, C2W, AW, ZW )
/*

*/
        i_pipe_spec_check( 0, 0, 480, 320, 0, 1, `IS_FORMAT_RGB, 8, 8, 8, 0, 0 );
        i_spec_check( 0, 0, 480, 320, 0, 1, `IS_FORMAT_RGB,       8, 8, 8, 0, 0 );

        i_pipe_spec_check( 0, 0, 480, 320, 0, 1, `IS_FORMAT_RGB, 5, 6, 5, 0, 0 );
        i_spec_check( 0, 0, 480, 320, 0, 1, `IS_FORMAT_RGB,       5, 6, 5, 0, 0 );

        i_pipe_spec_check( 0, 0, 480, 320, 0, 1, `IS_FORMAT_RGB, 5, 6, 5, 3, 3 );
        i_spec_check( 0, 0, 480, 320, 0, 1, `IS_FORMAT_RGB,       5, 6, 5, 3, 3 );

        i_pipe_spec_check( 0, 0, 480, 320, 0, 2, `IS_FORMAT_RGB, 5, 6, 5, 3, 3 );
        i_spec_check( 0, 0, 480, 320, 0, 2, `IS_FORMAT_RGB,       5, 6, 5, 3, 3 );

        i_pipe_spec_check( 0, 0, 10, 10, 0, 1, `IS_FORMAT_GRAYSCALE, 1, 0, 0, 0, 0 );
        i_spec_check( 0, 0, 10,  10,  0, 1, `IS_FORMAT_GRAYSCALE, 1, 0, 0, 0, 0 );

        i_pipe_spec_check( 0, 0, 10, 10, 0, 3, `IS_FORMAT_GRAYSCALE, 1, 0, 0, 0, 0 );
        i_spec_check( 0, 0, 10,  10,  0, 3, `IS_FORMAT_GRAYSCALE, 1, 0, 0, 0, 0 );

        i_pipe_spec_check( 1, 1, 11,  11,  0, 1, `IS_FORMAT_GRAYSCALE, 1, 0, 0, 0, 0 );
        i_spec_check( 1, 1, 11,  11,  0, 1, `IS_FORMAT_GRAYSCALE, 1, 0, 0, 0, 0 );

        i_pipe_spec_check( 100, 100, 100, 100, 0, 1, `IS_FORMAT_RGB,       5, 6, 5, 0, 0 );
        i_spec_check( 100, 100, 100, 100, 0, 1, `IS_FORMAT_RGB,       5, 6, 5, 0, 0 );

        // This nonsense spec can easily result in data > 255, which can not fit in the PipeSpec
        i_pipe_spec_check( 1, 2, 3, 4, 5, 1, 6, 5, 4, 3, 2, 1 );
        i_spec_check( 1, 2, 3, 4, 5, 1, 6, 5, 4, 3, 2, 1 );

        i_spec_check( (1<<`IS_X_BITS)-1, (1<<`IS_Y_BITS)-1, (1<<`IS_WIDTH_BITS)-1, (1<<`IS_HEIGHT_BITS)-1,
                      (1<<`IS_DEPTH_BITS)-1, (1<<`IS_PLANES_BITS)-1, (1<<`IS_FORMAT_BITS)-1,
                      (1<<`IS_C0_WIDTH_BITS)-1, (1<<`IS_C1_WIDTH_BITS)-1, (1<<`IS_C2_WIDTH_BITS)-1,
                      (1<<`IS_ALPHA_WIDTH_BITS)-1, (1<<`IS_Z_WIDTH_BITS)-1 );

        // can't do the huge check, because the Pipe Spec currently can only handle bus widths of 256 bits
        i_pipe_spec_check( (1<<`IS_X_BITS)-1, (1<<`IS_Y_BITS)-1, (1<<`IS_WIDTH_BITS)-1, (1<<`IS_HEIGHT_BITS)-1,
                      (1<<`IS_DEPTH_BITS)-1, 2, (1<<`IS_FORMAT_BITS)-1,
                    //   (1<<`IS_C0_WIDTH_BITS)-1, (1<<`IS_C1_WIDTH_BITS)-1, (1<<`IS_C2_WIDTH_BITS)-1,
                    //   (1<<`IS_ALPHA_WIDTH_BITS)-1, (1<<`IS_Z_WIDTH_BITS)-1 );
                      24, 24 ,24 ,24 ,24 );

        i1.test_pipe_values( AssertErrorCount, AssertTestCount );
        i1.test_image_values( AssertErrorCount, AssertTestCount );

        i2.test_pipe_values( AssertErrorCount, AssertTestCount );
        i2.test_image_values( AssertErrorCount, AssertTestCount );

        i3.test_pipe_values( AssertErrorCount, AssertTestCount );
        i3.test_image_values( AssertErrorCount, AssertTestCount );

        i4.test_pipe_values( AssertErrorCount, AssertTestCount );
        i4.test_image_values( AssertErrorCount, AssertTestCount );

        i5.test_pipe_values( AssertErrorCount, AssertTestCount );
        i5.test_image_values( AssertErrorCount, AssertTestCount );

        i6.test_pipe_values( AssertErrorCount, AssertTestCount );
        i6.test_image_values( AssertErrorCount, AssertTestCount );

        `Info( "Note: expect some errors with reduced size specs" );
        `Info( "   - Depth error is a result of 1b depth" );
        `Info( "   - Data assignment error is a result of 4b C0 component (not fitting 32!)" );
        `Info( "   - With 9b co-ordinates, 1b depth and data components 4b, expect 1153/1156" );

        `AssertSummary

        $finish;
    end

endmodule

