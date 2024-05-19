// This program was cloned from: https://github.com/davidthings/spokefpga
// License: Apache License 2.0

`timescale 1ns / 100ps

/*

Camera Image

Overview

    Camera Image containa to a camera and creates Images.  Images are in the
    same format that they come off the camera, sub windowed as specified.

    Controls like a Camera module, and has the hardware signals of the camera
    module, but hides the internal controls.

    Modifications to the size, orientation, pixel structure, etc. are all made
    by image_xxx modules external to this one.

    The Width and Height of the image is fixed (since the image output must be),
    but the origin of the window can be altered.

    Snapshot mode may be supported in the future when very deterministic behavior
    is needed, but this comes at the expense of automatic gain control.

Operation

    Start the camera by pulsing `config`.  This will begin the camera's configuration
    sequence.  During this time the camera will hold `configuring` high.

    Configuration happens in two phases - the first being the camera's own (see camera_
    core.v) and the next being configuration initiated by this module to set the camera
    up according to the image pipe's needs - window origin, and size but also
    blanking information.

    Once configured, the `configuring` line goes low and the camera enters the idle state.
    The camera can be toggled between `idle` and `running` with the `start` and `stop`
    signals.

    When the camera is `running` it is responsive to image requests from either the
    image port (`image_out_request`) or the `out_request_external` port.

    When an image request is received, the next available frame start (VS) causes
    data to start flowing out of the image port.

Issues

    - Peer to camera or owner?  Started out peer, but seems easier to enclose now.
      Peer does permit more sharing since there is no commitment to a particular
      camera.  But that's for later when we have more than one camera.

    - Since the camera is very fast, and asynchronous, and space for storing frames
      is very scarce, how can the signal be slowed?  Blanking!  We can add large
      numbers of clocks to each line to create a delay from one line to the next
      to allow other devices to catch up.  Connecting this output to a FIFO will
      permit smooth image transfer.

    - should there be a line of FIFO in here too?  Isn't the idea of an ImageLineFifo
      better than building it in?

    - Can blanking be infered automatically?  In principle this module could take
      note of pauses in the output and adjust outputs accordingly.  Advanced stuff!

    - Should this module handle camera states, or is that overstepping?  Leaning
      no.  This module needs only to know if the camera is camera_running or not.

    - Snapshot mode is not implemented.  Note that autoexposure does not run in
      snapshot mode, so exposure would have to be controlled externally.

    - do we need a push mode as well as a pull mode?

Use



Invocation

        //
        // Camera Core
        //

        wire       out_vs;
        wire       out_hs;
        wire       out_valid;
        wire [9:0] out_d;

        wire       vs;
        wire       hs;
        wire       pclk;
        wire       xclk;
        wire [9:0] d;
        wire       rst;
        wire       led;
        wire       pwdn;

        wire       trigger;

        reg configure;
        reg start;
        reg stop;

        wire configuring;
        wire idle;
        wire camera_running;
        wire error;
        wire busy;
        wire image_transfer;

        // Image Control
        reg [CoordinateWidth-1:0] image_x;
        reg [CoordinateWidth-1:0] image_y;
        reg image_origin_update;

        // Image Out (can't be the full width of the camera (min col start is 1, min row start is 4)
        localparam IS =  `IS( 0, 0, CameraWidth - 1, CameraHeight - 4, 0, 1, `IS_FORMAT_GRAYSCALE, 10, 0, 0, 0, 0 );

        localparam ImageWidth = `IS_WIDTH( IS );
        localparam ImageHeight = `IS_HEIGHT( IS );

        localparam ImagePixelCount = `IS_PIXEL_COUNT( IS );

        localparam ImageWidthWidth =  `IS_WIDTH_WIDTH( IS );
        localparam ImageHeightWidth = `IS_HEIGHT_WIDTH( IS );
        localparam ImageDataWidth =   `IS_DATA_WIDTH( IS );

        localparam ImageC0Width =     `IS_C0_WIDTH( IS );
        localparam ImageC1Width =     `IS_C1_WIDTH( IS );
        localparam ImageC2Width =     `IS_C2_WIDTH( IS );
        localparam ImageAlphaWidth =  `IS_ALPHA_WIDTH( IS );
        localparam ImageZWidth =      `IS_Z_WIDTH( IS );

        wire [`I_w( IS )-1:0 ] image_out;
        reg                    out_request_external;

        // All the out signals
        wire                 image_out_start;
        wire                 image_out_stop;
        wire [ImageDataWidth-1:0] image_out_data;
        wire                 image_out_valid;
        wire                 image_out_error;
        wire                 image_out_ready;
        wire                 image_out_request;
        wire                 image_out_cancel;

        // Monitoring all the signals
        assign image_out_start = `I_Start( IS, image_out );
        assign image_out_stop = `I_Stop( IS, image_out );
        assign image_out_data = `I_Data( IS, image_out );
        assign image_out_error = `I_Error( IS, image_out );
        assign image_out_valid = `I_Valid( IS, image_out );

        assign image_out_request = `I_Valid( IS, image_out );
        assign image_out_cancel = `I_Cancel( IS, image_out );
        assign image_out_ready = `I_Ready( IS, image_out );

        camera_image #(
                .IS( IS ),
                .CameraWidth( CameraWidth ),
                .CameraHeight( CameraHeight )
            ) cam_image (
                .clock( clock ),
                .reset( reset ),

                // Camera Control
                .configure( configure ),
                .start( start ),
                .stop( stop ),

                // Camera Status
                .configuring( configuring ),
                .error( error ),
                .idle( idle ),
                .camera_running( camera_running ),
                .busy( busy ),
                .image_transfer( image_transfer ),

                // Image Control
                .image_x( image_x ),
                .image_y( image_y ),
                .image_origin_update( image_origin_update ),

                // Image Out
                .image_out( image_out ),
                .out_request_external( out_request_external ),

                // Connections to the hardware
                .scl_in( scl ),
                .scl_out( camera_scl_out ),
                .sda_in( sda ),
                .sda_out( camera_sda_out ),
                .vs( vs ),
                .hs( hs ),
                .pclk( pclk ),
                .d( d ),
                .rst( rst ),
                .pwdn( pwdn ),
                .led( led ),
                .trigger( trigger )
            );




Sub Modules


Testing

    Tested in camera_image_tb.v

    Tested on the Hackaday 2019 Badge (ECP5)

*/

`include "../../pipe/rtl/pipe_defs.v"
`include "../../image/rtl/image_defs.v"

module camera_image #(
        parameter [`IS_w-1:0] IS = `IS_CAMERA,

        parameter CameraWidth = 752,
        parameter CameraHeight = 482,

        parameter ImageXInitial = 0,
        parameter ImageYInitial = 0,

        parameter CameraHorizontalBlanking = 600,
        parameter CameraVerticalBlanking = 750,   // CHECK ON THIS

        parameter BlankingWidth = 10,
        parameter CoordinateWidth = 10,
        parameter CameraPixelWidth = 10,

        parameter I2CClockCount = 200,
        parameter I2CGapCount = ( 1 << 8 )
    ) (
        input clock,
        input reset,

        // Camera Control
        input  configure,
        input  start,
        input  stop,

        // Camera Status
        output configuring,
        output error,
        output idle,
        output running,
        output busy,
        output image_transfer,

        // Image Control
        input [CoordinateWidth-1:0] image_x,
        input [CoordinateWidth-1:0] image_y,
        input image_origin_update,

        // Image Out
        inout [`I_w( IS )-1:0 ] image_out,
        input                   out_request_external,

        // Camera Connections to Hardware
        output scl_out,
        input  scl_in,
        output sda_out,
        input  sda_in,
        input  vs,
        input  hs,
        input  pclk,
        input  [CameraPixelWidth-1:0] d,
        output rst,
        output pwdn,
        input  led,
        output trigger,

        output [7:0] debug
    );


    //
    // Spec Info
    //

    localparam ImageWidth  = `IS_WIDTH( IS );
    localparam ImageHeight = `IS_HEIGHT( IS );

    localparam ImageWidthWidth  = `IS_WIDTH_WIDTH( IS );
    localparam ImageHeightWidth = `IS_HEIGHT_WIDTH( IS );
    localparam ImageDataWidth   = `IS_DATA_WIDTH( IS );

    localparam ImageC0Width = `I_C0_w( IS );
    localparam ImageC1Width = `I_C1_w( IS );
    localparam ImageC2Width = `I_C2_w( IS );

    //
    // Local Copies
    //

    reg ci_configuring;
    reg ci_image_transfer;
    reg ci_busy;

    assign configuring = ci_configuring;
    assign image_transfer = ci_image_transfer;
    assign busy = ci_busy || camera_busy;
    assign running = camera_running;
    assign idle = camera_idle;

    //
    // Camera Core
    //

    // camera controls
    reg camera_configure;
    reg camera_start;
    reg camera_stop;

    // camera status
    wire camera_idle;
    wire camera_running;
    wire camera_configuring;
    wire camera_busy;

    reg [CoordinateWidth-1:0] column_start;
    reg [CoordinateWidth-1:0] row_start;
    reg [CoordinateWidth-1:0] window_width;
    reg [CoordinateWidth-1:0] window_height;
    reg set_window;
    reg set_origin;

    reg [BlankingWidth-1:0]   horizontal_blanking;
    reg [BlankingWidth-1:0]   vertical_blanking;
    reg set_blanking;

    reg snapshot_mode;
    reg set_snapshot_mode;
    reg snapshot;

    wire       out_vs;
    wire       out_hs;
    wire       out_valid;
    wire [CameraPixelWidth-1:0] out_d;

    //                     7              6         5           4         3           2                  1                  0
    assign debug = {  image_out_request, busy,  camera_start, start, camera_running, camera_idle, camera_configuring, camera_configure };

    camera_core #(
            .Width( CameraWidth ),
            .Height( CameraHeight ),
            .BlankingWidth( BlankingWidth ),
            .CameraPixelWidth( CameraPixelWidth ),
            .I2CClockCount( I2CClockCount ),
            .I2CGapCount( I2CGapCount )
        ) cam (
            .clock( clock ),
            .reset( reset ),

            // Camera Control
            .configure( camera_configure ),
            .start( camera_start ),
            .stop( camera_stop ),

            // Camera Status
            .configuring( camera_configuring ),
            .idle( camera_idle ),
            .running( camera_running ),
            .busy( camera_busy ),
            .error( error ),

            // Set Window / Origin
            .column_start( column_start ),
            .row_start( row_start),
            .window_width( window_width ),
            .window_height( window_height ),
            .set_origin( set_origin ),
            .set_window( set_window ),

            // Set Blanking
            .horizontal_blanking( horizontal_blanking ),
            .vertical_blanking( vertical_blanking ),
            .set_blanking( set_blanking ),

            // Set Snapshot
            .snapshot_mode( snapshot_mode ),
            .set_snapshot_mode( set_snapshot_mode ),

            .snapshot( snapshot ),

            // Camera Data
            .out_vs( out_vs ),
            .out_hs( out_hs ),
            .out_valid( out_valid ),
            .out_d( out_d ),

            // Connections to the hardware
            .scl_in( scl_in ),
            .scl_out( scl_out ),
            .sda_in( sda_in ),
            .sda_out( sda_out ),
            .vs( vs ),
            .hs( hs ),
            .pclk( pclk ),
            .d( d ),
            .rst( rst ),
            .pwdn( pwdn ),
            .led( led ),
            .trigger( trigger )
        );

    //
    // Image Out
    //

    // Grab all the signals from the image pipe
    reg                      image_out_start;
    reg                      image_out_stop;
    reg [ImageDataWidth-1:0] image_out_data;
    reg                      image_out_valid;
    reg                      image_out_error;

    wire                     image_out_request;
    wire                     image_out_cancel;
    wire                     image_out_ready;

    // Assign the outgoing signals
    assign `I_Start( IS, image_out ) = image_out_start;
    assign `I_Stop( IS, image_out )  = image_out_stop;
    assign `I_Data( IS, image_out )  = image_out_data;
    assign `I_Valid( IS, image_out ) = image_out_valid;
    assign `I_Error( IS, image_out ) = image_out_error;

    // Assign the incoming signals
    assign image_out_request = `I_Request( IS, image_out );
    assign image_out_cancel  = `I_Cancel(  IS, image_out );
    assign image_out_ready   = `I_Ready(   IS, image_out );

    localparam CIM_STATE_POWERUP            = 0,
               CIM_STATE_CONFIGURING        = 1,
               CIM_STATE_WAIT_CONFIGURING   = 2,
               CIM_STATE_CONFIGURE_WINDOW   = 3,
               CIM_STATE_CONFIGURE_BLANKING = 4,
               CIM_STATE_RUNNABLE           = 5,
               CIM_STATE_FRAME_IDLE         = 6,
               CIM_STATE_FRAME_START        = 7,
               CIM_STATE_FRAME_DATA         = 8,
               CIM_STATE_FRAME_END          = 9;

    reg [3:0] cim_state;

    reg [ImageWidthWidth+ImageHeightWidth:0] image_pixel_counter;


    localparam CommandTimerWidth = 4;
    localparam CommandTimerShortCount = 10;

    reg [ CommandTimerWidth:0 ] command_timer;
    wire command_timer_expired = command_timer[ CommandTimerWidth ];

    always @( posedge clock ) begin
        if ( reset ) begin
            cim_state <= CIM_STATE_POWERUP;

            camera_start <= 0;
            camera_stop <= 0;

            command_timer <= -1;

            // local copies of camera status
            ci_configuring <= 0;
            ci_image_transfer <= 0;

            // camera control signals
            column_start <= 0;
            row_start <= 0;
            window_width <= 0;
            window_height <= 0;
            set_window <= 0;
            set_origin <= 0;
            horizontal_blanking <= 0;
            vertical_blanking <= 0;
            set_blanking <= 0;
            snapshot_mode <= 0;
            set_snapshot_mode <= 0;
            snapshot <= 0;

            // image output
            image_out_start <= 0;
            image_out_stop <= 0;
            image_out_data <= 0;
            image_out_valid <= 0;
            image_out_error <= 0;

            image_pixel_counter <= 0;

        end else begin
            case ( cim_state )
                CIM_STATE_POWERUP: begin // 0
                        if ( configure ) begin
                            camera_configure <= 1;
                            ci_busy <= 1;
                            cim_state <= CIM_STATE_WAIT_CONFIGURING;
                            ci_configuring <= 1;
                            command_timer <= CommandTimerShortCount;
                        end
                    end
                CIM_STATE_WAIT_CONFIGURING: begin // 1
                        if ( command_timer_expired ) begin
                            if ( camera_configuring ) begin
                                cim_state <= CIM_STATE_CONFIGURING;
                                command_timer <= CommandTimerShortCount;
                            end
                        end else begin
                            command_timer <= command_timer - 1;
                        end
                    end
                CIM_STATE_CONFIGURING: begin // 2
                        camera_configure <= 0;
                        if ( command_timer_expired ) begin
                            if ( camera_idle && ~camera_busy ) begin
                                column_start <= ImageXInitial;
                                row_start <= ImageYInitial;
                                window_width <= ImageWidth;
                                window_height <= ImageHeight;
                                set_window <= 1;
                                command_timer <= CommandTimerShortCount;
                                cim_state <= CIM_STATE_CONFIGURE_WINDOW;
                            end
                        end else begin
                            command_timer <= command_timer - 1;
                        end
                    end
                CIM_STATE_CONFIGURE_WINDOW: begin // 3
                        set_window <= 0;
                        if ( command_timer_expired ) begin
                            column_start <= 0;
                            row_start <= 0;
                            window_width <= 0;
                            window_height <= 0;
                            if ( camera_idle && ~camera_busy ) begin
                                horizontal_blanking <= CameraHorizontalBlanking;
                                vertical_blanking <= CameraVerticalBlanking;
                                set_blanking <= 1;
                                command_timer <= CommandTimerShortCount;
                                cim_state <= CIM_STATE_CONFIGURE_BLANKING;
                            end
                        end else begin
                            command_timer <= command_timer - 1;
                        end
                    end
                CIM_STATE_CONFIGURE_BLANKING: begin // 4
                        set_blanking <= 0;
                        horizontal_blanking <= 0;
                        vertical_blanking <= 0;
                        if ( command_timer_expired ) begin
                            if ( camera_idle && ~camera_busy ) begin
                                ci_configuring <= 0;
                                command_timer <= CommandTimerShortCount;
                                ci_busy <= 0;
                                cim_state <= CIM_STATE_RUNNABLE;
                            end
                        end else begin
                            command_timer <= command_timer - 1;
                        end
                    end
                CIM_STATE_RUNNABLE: begin // 5
                        // if ( stored origin change )
                        //     change origin
                        if ( start )
                            camera_start <= 1;
                        else
                            camera_start <= 0;
                        if ( stop )
                            camera_stop <= 1;
                        else
                            camera_stop <= 0;

                        if ( camera_running && ( out_request_external || image_out_request ) ) begin
                            ci_busy <= 1;
                            cim_state <= CIM_STATE_FRAME_IDLE;
                            image_pixel_counter <= 0;
                        end
                    end
                CIM_STATE_FRAME_IDLE: begin // 6
                        if ( image_out_cancel ) begin
                            ci_busy <= 0;
                            cim_state <= CIM_STATE_RUNNABLE;
                        end else begin
                            if ( ~out_vs ) begin
                                cim_state <= CIM_STATE_FRAME_START;
                            end
                        end
                    end
                CIM_STATE_FRAME_START: begin // 7
                        if ( image_out_cancel ) begin
                            ci_busy <= 0;
                            cim_state <= CIM_STATE_RUNNABLE;
                        end else begin
                            if ( out_vs ) begin
                                cim_state <= CIM_STATE_FRAME_DATA;
                            end
                        end
                    end
                CIM_STATE_FRAME_DATA: begin // 8
                        if ( image_out_cancel ) begin
                            cim_state <= CIM_STATE_FRAME_END;
                        end else begin
                            if ( out_valid ) begin
                                image_out_valid <= 1;
                                image_out_data <= out_d;
                                image_out_start <= ( image_pixel_counter == 0 );
                                if ( image_pixel_counter == 0 )
                                    ci_image_transfer <= 1;
                                if ( ( image_pixel_counter == ( ( ImageWidth * ImageHeight ) - 1  ) ) ) begin
                                    image_out_stop <= 1;
                                    cim_state <= CIM_STATE_FRAME_END;
                                    ci_image_transfer <= 0;
                                end
                                image_pixel_counter <= image_pixel_counter + 1;
                                // if ( ~out_ready )
                                //     abort!
                            end else begin
                                image_out_valid <= 0;
                                image_out_data <= 0;
                                image_out_start <= 0;
                                image_out_stop <= 0;
                            end
                        end
                    end
                CIM_STATE_FRAME_END: begin // 9
                        image_pixel_counter <= 0;
                        image_out_valid <= 0;
                        image_out_data <= 0;
                        image_out_start <= 0;
                        image_out_stop <= 0;
                        ci_busy <= 0;
                        if ( !out_vs ) begin
                            cim_state <= CIM_STATE_RUNNABLE;
                        end
                    end
            endcase
        end
    end

endmodule