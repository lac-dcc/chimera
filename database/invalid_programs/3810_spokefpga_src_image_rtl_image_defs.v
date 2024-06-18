// This program was cloned from: https://github.com/davidthings/spokefpga
// License: Apache License 2.0


/*

Image Defs

Definitions for the specification and manipulation of Images

Basics

    This spec is based on Pipespec, so that it can be treated as a pipe.

    Pipe Fields
        Data
        Start
        Stop
        Valid
        Ready

    Image Spec Fields
        Image X Offset (13b,0-8191, -1 inline)
        Image Y Offset (13b,0-8191, -1 inline)
        Image Width    (13b,0-8191, -1 inline)
        Image Height   (13b,0-8191, -1 inline)
        Image Planes   (4b,0-15)
        Format         (4b,G=0,RGB=1,YCbCr=2,HSV=3,I=4,XY=5...)
        C0 Width       (6b,0-63bits)
        C1 Width       (6b,0-63bits)
        C2 Width       (6b,0-63bits)
        Alpha Width    (6b,0-63bits)
        Z Width        (6b,0-63bits)

    Image Fields

        Planes x
            C0
            C1
            C2
            Alpha
            Z

        // inline image location and size are for future implementations - likely will want a flag for inline and a way to specify width
        // for future Sparse Mode, need a flag, data would be broken into strip lines, each with X,Y,Length,Pixels

    Suffixes
        _w - Width
        _l - least significant bit
        _m - most significant bit

    Prefixes
        IS_ Image Specs

        I_  Image Values

        image_ operations on image numbers

IMAGE SPEC & MANIPULATION

    | Z Width     | Alpha Width | C2 Width    | C1 Width    | C0 Width    | Format  | Planes  |
    | Z Z Z Z Z Z | A A A A A A | 2 2 2 2 2 2 | 1 1 1 1 1 1 | 0 0 0 0 0 0 | F F F F | P P P P |
    | 89       84 | 83       78 | 77       72 | 71       66 | 65       60 | 59   56 | 55   52 |  // bits all wrong

    | Depth                     |
    | D D D D D D D D D D D D D |
    | 64                     52 |

    | Height                    | Width                     | Y Offset                  | X Offset                  |
    | H H H H H H H H H H H H H | W W W W W W W W W W W W W | Y Y Y Y Y Y Y Y Y Y Y Y Y | X X X X X X X X X X X X X |
    | 51                     39 | 38                     26 | 25                     13 | 12                      0 |


    Create an Image Spec

    `IS( x_offset, y_offset, width, height, depth, planes, format, c0_width, c1_width, c2_width, alpha_width, depth_width )

    FORMAT = 0 => IMAGE_FORMAT_G
             1 => IMAGE_FORMAT_RGB
             2 => IMAGE_FORMAT_YCbCr
             3 => IMAGE_FORMAT_HSV
             4 => IMAGE_FORMAT_I
             5 => IMAGE_FORMAT_XY


    `IS_TOTAL_WIDTH( IS ) -> Returns the overall width of the pipe (includes START, STOP, READ, VALID and REQUEST)
    `IS_X( IS ) -> Returns the X Offset
    `IS_Y( IS ) -> Returns the Y Offset
    `IS_WIDTH( IS ) -> Returns the Width
    `IS_HEIGHT( IS ) -> Returns the Height
    `IS_DEPTH( IS ) -> Returns the Depth
    `IS_PLANES( IS ) -> Returns the number of Planes
    `IS_FORMAT( IS ) -> Returns the pixel format (see the FORMAT above)
    `IS_PAYLOAD_WIDTH( IS ) -> Returns the overall width of the data
    `IS_DATA_WIDTH( IS ) -> Returns the overall width of the pixel data (planes x pixel width)
    `IS_C0_WIDTH( IS ) -> Returns the width of component 0 - depending on format - can be zero
    `IS_C1_WIDTH( IS ) -> Returns the width of component 1 - depending on format - can be zero
    `IS_C2_WIDTH( IS ) -> Returns the width of component 2 - depending on format - can be zero
    `IS_ALPHA_WIDTH( IS ) -> Returns the width of the Alpha component - can be zero
    `IS_Z_WIDTH( IS ) -> Returns the width of the Z component - can be zero

IMAGE & MANIPULATION

    Each data item is the pixel width (sum of all the components) for each plane.

    | READY | VALID | REQUEST | CANCEL | ERROR | START | STOP |  ...
    | 1 rev | 1     | 1 rev   | 1 rev  | 1     | 1     | 1    |  ...

    | Depth.n | Alpha.n | C2.n | C1.n | C0.n | ... | Depth.0 | Alpha.0 | C2.0 | C1.0 | C0.0 |
    | D       | A       | 2    | 1    | 0    | ... | D       | A       | 2    | 1    | 0    |

       rev - reverse signal, travelling back up the pipeline.

    `I_CREATE( IS ) -> returns an empty data item

    `I_READY( IS, data ) -> returns the ready signal
    `I_VALID( IS, data ) -> returns the valid signal

    `I_REQUEST( IS, data ) -> returns the request signal
    `I_CANCEL( IS, data ) -> returns the cancel signal
    `I_ERROR( IS, data ) -> returns the error signal
    `I_START( IS, data ) -> returns the start signal
    `I_STOP( IS, data ) -> returns the stop signal

    `I_C0( IS, plane, data ) -> Returns Component 0 of the specified plane of the data
    `I_C1( IS, plane, data ) -> Returns Component 1 of the specified plane of the data
    `I_C2( IS, plane, data ) -> Returns Component 2 of the specified plane of the data
    `I_ALPHA( IS, plane, data ) -> Returns the Alpha of the specified plane of the data
    `I_Z( IS, plane, data ) -> Returns the Z of the specified plane of the data

    // `I_C0_SET( IS, plane, data, value ) -> Sets Component 0 of the specified plane of the data
    // `I_C1_SET( IS, plane, data, value ) -> Sets Component 1 of the specified plane of the data
    // `I_C2_SET( IS, plane, data, value ) -> Sets Component 2 of the specified plane of the data
    // `I_ALPHA_SET( IS, plane, data, value ) -> Sets the Alpha of the specified plane of the data
    // `I_Z_SET( IS, plane, data, value ) -> Sets the Z of the specified plane of the data

    In all these cases, "returns" means presents the correct bits.  Care must be taken that the field exists at all.

    There might still need to be some modules to pack and unpack multiple items at once, but let's try these.

Main Use Patterns

Create a spec
    `IS( x_offset, y_offset, width, height, depth, planes, format, c0_width, c1_width, c2_width, alpha_width, depth_width )

Create an Image data item

    `I_CREATE( IS )

Issues

    Deriving Image Spec fields is an incredibly long process.  This results in comically long macros.
    Especially when I insist on adding spaces everywhere.

    The Image Spec itself is an ungainly 103 or so bits.  This means that localparams and parameters may
    require explicit sizing

    Should we have an X, Y Offset or not?

        - should an image care where it is?
        - will an image or image pipeline ever care where it is intrinsically, or is this always out of band?
        - obviously anything that composes larger images from smaller ones needs to be able to place objects.
        - sparse images certainly place interior contents
        - the driver can take flexible dimensions

    Should the offset, if we have one, be center-based or corner-based?


*/

`include "../../pipe/rtl/pipe_defs.v"

//
// Image Spec Field Widths and Masks
//

// `define IS_X_BITS           (4'D4)
// `define IS_Y_BITS           (4'D4)
// `define IS_WIDTH_BITS       (4'D4)
// `define IS_HEIGHT_BITS      (4'D4)
// `define IS_DEPTH_BITS       (4'D4)

// Reduced size spec
`define IS_X_BITS           (9)
`define IS_Y_BITS           (9)
`define IS_WIDTH_BITS       (9)
`define IS_HEIGHT_BITS      (9)
`define IS_DEPTH_BITS       (1)
`define IS_PLANES_BITS      (4)
`define IS_FORMAT_BITS      (4)
`define IS_C0_WIDTH_BITS    (4)
`define IS_C1_WIDTH_BITS    (4)
`define IS_C2_WIDTH_BITS    (4)
`define IS_ALPHA_WIDTH_BITS (4)
`define IS_Z_WIDTH_BITS     (2)

// Full sized image spec
// `define IS_X_BITS           (13)
// `define IS_Y_BITS           (13)
// `define IS_WIDTH_BITS       (13)
// `define IS_HEIGHT_BITS      (13)
// `define IS_DEPTH_BITS       (13)
// `define IS_PLANES_BITS      (4)
// `define IS_FORMAT_BITS      (4)
// `define IS_C0_WIDTH_BITS    (6)
// `define IS_C1_WIDTH_BITS    (6)
// `define IS_C2_WIDTH_BITS    (6)
// `define IS_ALPHA_WIDTH_BITS (6)
// `define IS_Z_WIDTH_BITS     (6)

`define IS_X_MASK           ( ( 1<<`IS_X_BITS ) - 1 )
`define IS_Y_MASK           ( ( 1<<`IS_Y_BITS ) - 1 )
`define IS_WIDTH_MASK       ( ( 1<<`IS_WIDTH_BITS ) - 1 )
`define IS_HEIGHT_MASK      ( ( 1<<`IS_HEIGHT_BITS ) - 1 )
`define IS_DEPTH_MASK       ( ( 1<<`IS_DEPTH_BITS ) - 1 )
`define IS_PLANES_MASK      ( ( 1<<`IS_PLANES_BITS ) - 1 )
`define IS_FORMAT_MASK      ( ( 1<<`IS_FORMAT_BITS ) - 1 )
`define IS_C0_WIDTH_MASK    ( ( 1<<`IS_C0_WIDTH_BITS ) - 1 )
`define IS_C1_WIDTH_MASK    ( ( 1<<`IS_C1_WIDTH_BITS ) - 1 )
`define IS_C2_WIDTH_MASK    ( ( 1<<`IS_C2_WIDTH_BITS ) - 1 )
`define IS_ALPHA_WIDTH_MASK ( ( 1<<`IS_ALPHA_WIDTH_BITS ) - 1 )
`define IS_Z_WIDTH_MASK     ( ( 1<<`IS_Z_WIDTH_BITS ) - 1 )

//
// Image Spec Fields
//

// Each field is the previous field's final bit + 1

`define IS_X_l           (0)
`define IS_X_m           (`IS_X_l +`IS_X_BITS - 1)
`define IS_Y_l           (`IS_X_m + 1)
`define IS_Y_m           (`IS_Y_l +`IS_Y_BITS - 1)
`define IS_WIDTH_l       (`IS_Y_m + 1)
`define IS_WIDTH_m       (`IS_WIDTH_l +`IS_WIDTH_BITS - 1)
`define IS_HEIGHT_l      (`IS_WIDTH_m + 1)
`define IS_HEIGHT_m      (`IS_HEIGHT_l +`IS_HEIGHT_BITS - 1)
`define IS_DEPTH_l       (`IS_HEIGHT_m + 1)
`define IS_DEPTH_m       (`IS_DEPTH_l +`IS_DEPTH_BITS - 1)
`define IS_PLANES_l      (`IS_DEPTH_m + 1)
`define IS_PLANES_m      (`IS_PLANES_l +`IS_PLANES_BITS - 1)
`define IS_FORMAT_l      (`IS_PLANES_m + 1)
`define IS_FORMAT_m      (`IS_FORMAT_l + `IS_FORMAT_BITS - 1)
`define IS_C0_WIDTH_l    (`IS_FORMAT_m + 1)
`define IS_C0_WIDTH_m    (`IS_C0_WIDTH_l +`IS_C0_WIDTH_BITS - 1)
`define IS_C1_WIDTH_l    (`IS_C0_WIDTH_m + 1)
`define IS_C1_WIDTH_m    (`IS_C1_WIDTH_l +`IS_C1_WIDTH_BITS - 1)
`define IS_C2_WIDTH_l    (`IS_C1_WIDTH_m + 1)
`define IS_C2_WIDTH_m    (`IS_C2_WIDTH_l +`IS_C2_WIDTH_BITS - 1)
`define IS_ALPHA_WIDTH_l (`IS_C2_WIDTH_m + 1)
`define IS_ALPHA_WIDTH_m (`IS_ALPHA_WIDTH_l +`IS_ALPHA_WIDTH_BITS - 1)
`define IS_Z_WIDTH_l     (`IS_ALPHA_WIDTH_m + 1)
`define IS_Z_WIDTH_m     (`IS_Z_l + `IS_Z_WIDTH_BITS)

`define IS_w (  `IS_X_BITS + `IS_Y_BITS + `IS_WIDTH_BITS + `IS_HEIGHT_BITS + `IS_DEPTH_BITS + \
               `IS_PLANES_BITS + `IS_FORMAT_BITS + \
               `IS_C0_WIDTH_BITS + `IS_C1_WIDTH_BITS + `IS_C2_WIDTH_BITS + `IS_ALPHA_WIDTH_BITS + `IS_Z_WIDTH_BITS )

//
// Image Spec Creation and Reading
//

// Build spec (these setters are designed to be bitwise or'ed ( | ) together to build a spec

`define IS_X_SET( X )           ( ( X & `IS_X_MASK ) << `IS_X_l )
`define IS_Y_SET( Y )           ( ( Y & `IS_Y_MASK ) << `IS_Y_l )
`define IS_WIDTH_SET( W )       ( ( W & `IS_WIDTH_MASK ) << `IS_WIDTH_l )
`define IS_HEIGHT_SET( H )      ( ( H & `IS_HEIGHT_MASK ) << `IS_HEIGHT_l )
`define IS_DEPTH_SET( D )       ( ( D & `IS_DEPTH_MASK ) << `IS_DEPTH_l )
`define IS_PLANES_SET( P )      ( ( P & `IS_PLANES_MASK ) << `IS_PLANES_l )
`define IS_FORMAT_SET( F )      ( ( F & `IS_FORMAT_MASK ) << `IS_FORMAT_l )
`define IS_C0_WIDTH_SET( C0 )   ( ( C0 & `IS_C0_WIDTH_MASK ) << `IS_C0_WIDTH_l )
`define IS_C1_WIDTH_SET( C1 )   ( ( C1 & `IS_C1_WIDTH_MASK ) << `IS_C1_WIDTH_l )
`define IS_C2_WIDTH_SET( C2 )   ( ( C2 & `IS_C2_WIDTH_MASK ) << `IS_C2_WIDTH_l )
`define IS_ALPHA_WIDTH_SET( A ) ( ( A & `IS_ALPHA_WIDTH_MASK ) << `IS_ALPHA_WIDTH_l )
`define IS_Z_WIDTH_SET( Z )     ( ( Z & `IS_Z_WIDTH_MASK ) << `IS_Z_WIDTH_l )

// Create spec - one hit, all the params at once.  Using the setters above, bitwise or'ed together
`define IS( X, Y, W, H, D, P, F, C0, C1, C2, A, Z ) \
            ( `IS_X_SET( X ) | `IS_Y_SET( Y ) | `IS_WIDTH_SET( W ) | `IS_HEIGHT_SET( H ) | `IS_DEPTH_SET( D ) |  \
              `IS_PLANES_SET( P ) | `IS_FORMAT_SET( F ) |  \
              `IS_C0_WIDTH_SET( C0 ) | `IS_C1_WIDTH_SET( C1 ) | `IS_C2_WIDTH_SET( C2 ) |  \
              `IS_ALPHA_WIDTH_SET( A ) | `IS_Z_WIDTH_SET( Z ) )

// Definitions of the FORMAT field
`define IS_FORMAT_GRAYSCALE     ( 0 )
`define IS_FORMAT_RGB           ( 1 )
`define IS_FORMAT_HSV           ( 2 )
`define IS_FORMAT_YCbCr         ( 3 )
`define IS_FORMAT_BAYER         ( 4 )
`define IS_FORMAT_INDEX         ( 5 )
`define IS_FORMAT_INDEX_XY      ( 6 )
`define IS_FORMAT_YOUR_MOTHER   ( 7 )

//
// Image Pipe Spec
//

// The Pipelined Image is actually just a plain Pipe.
//  Here we're defining the base level pipe.  The above spec defines the image and specifies the data
//
// The few signals required for images are mapped into pipe fields as follows.

// Image.Start   = Pipe.Start
// Image.Stop    = Pipe.Stop
// Image.Request = Pipe.Request[ 0 ]  (request an image from downstream to upstream)
// Image.Cancel  = Pipe.Result[ 0 ]   (cancel the request from downstream to upstream)
// Image.Error   = Pipe.Command[ 0 ]  (error encountered from upstream to downstream)

// Read spec fields
// ... actual values that apply to all images with this spec
// ... it is an error that these are IS_XX, they should be I_Xx or I_Xx
//     they are getting values from the particular SPEC
`define IS_X( is )              ( ( is >> `IS_X_l ) & `IS_X_MASK )
`define IS_Y( is )              ( ( is >> `IS_Y_l ) & `IS_Y_MASK )
`define IS_WIDTH( is )          ( ( is >> `IS_WIDTH_l ) & `IS_WIDTH_MASK )
`define IS_HEIGHT( is )         ( ( is >> `IS_HEIGHT_l ) & `IS_HEIGHT_MASK )
`define IS_DEPTH( is )          ( ( is >> `IS_DEPTH_l ) & `IS_DEPTH_MASK )
`define IS_FORMAT( is )         ( ( is >> `IS_FORMAT_l ) & `IS_FORMAT_MASK )
`define IS_PLANES( is )         ( ( is >> `IS_PLANES_l ) & `IS_PLANES_MASK )
// ... widths - specification of the widths of the data fields that will actually be sent
`define IS_C0_WIDTH( is )       ( ( is >> `IS_C0_WIDTH_l ) & `IS_C0_WIDTH_MASK )
`define IS_C1_WIDTH( is )       ( ( is >> `IS_C1_WIDTH_l ) & `IS_C1_WIDTH_MASK )
`define IS_C2_WIDTH( is )       ( ( is >> `IS_C2_WIDTH_l ) & `IS_C2_WIDTH_MASK )
`define IS_ALPHA_WIDTH( is )    ( ( is >> `IS_ALPHA_WIDTH_l ) & `IS_ALPHA_WIDTH_MASK )
`define IS_Z_WIDTH( is )        ( ( is >> `IS_Z_WIDTH_l ) & `IS_Z_WIDTH_MASK )

`define IS_X_WIDTH( is )        ( $clog2( `IS_X( is ) + 1 ) )
`define IS_Y_WIDTH( is )        ( $clog2( `IS_Y( is ) + 1 ) )

`define IS_WIDTH_WIDTH( is )    ( $clog2( `IS_WIDTH( is ) + 1 ) )
`define IS_HEIGHT_WIDTH( is )   ( $clog2( `IS_HEIGHT( is ) + 1 ) )

`define IS_PIXEL_COUNT( is )       ( `IS_WIDTH( is ) * `IS_HEIGHT( is ) )
`define IS_PIXEL_COUNT_WIDTH( is ) ( $clog2( `IS_PIXEL_COUNT( is ) + 1 ) )

`define IS_PLANE_WIDTH( is )  ( `IS_C0_WIDTH( is ) + `IS_C1_WIDTH( is ) + `IS_C2_WIDTH( is ) + `IS_ALPHA_WIDTH( is ) + `IS_Z_WIDTH( is ) )

// Overall data width is the number of planes x size of data
`define IS_DATA_WIDTH( is )   ( `IS_PLANES( is ) * `IS_PLANE_WIDTH( is ) )

// We fix other parts of the Pipe Spec (eg. we know we won't need data size, will need start, stop, etc.)
`define IS_PIPE_DATA_SIZE     (0)
`define IS_PIPE_START_STOP    (1)
`define IS_PIPE_REVERSE       (0)
`define IS_PIPE_COMMAND_WIDTH (1)
`define IS_PIPE_REQUEST_WIDTH (1)
`define IS_PIPE_RESULT_WIDTH  (1)

// now we can build a pipespec from an image spec
`define IS_PIPE_SPEC( is ) (`PS( `IS_DATA_WIDTH( is ), `IS_PIPE_DATA_SIZE, `IS_PIPE_START_STOP, \
                                 `IS_PIPE_REVERSE, `IS_PIPE_COMMAND_WIDTH, `IS_PIPE_RESULT_WIDTH, `IS_PIPE_REQUEST_WIDTH ))

//
// Image Field Positions
//

// Image pipe fields are provided by the pipe macros

`define I_w( is )               ( `P_w( `IS_PIPE_SPEC( is ) ) )

`define I_Data_w( is )          ( `P_Data_w( `IS_PIPE_SPEC( is ) ) )
`define I_Data_l( is )          ( `P_Data_l( `IS_PIPE_SPEC( is ) ) )
`define I_Data_m( is )          ( `P_Data_m( `IS_PIPE_SPEC( is ) ) )

// Payload is Data + Start + Stop - everything else is command or ephemera
`define I_Payload_w( is )       ( `P_Payload_w( `IS_PIPE_SPEC( is ) ) )
`define I_Payload_l( is )       ( `P_Payload_l( `IS_PIPE_SPEC( is ) ) )
`define I_Payload_m( is )       ( `P_Payload_m( `IS_PIPE_SPEC( is ) ) )

`define I_Start_w( is )          ( 1 )
`define I_Start_l( is )          ( `P_Start_l( `IS_PIPE_SPEC( is ) ) )
`define I_Start_m( is )          ( `P_Start_m( `IS_PIPE_SPEC( is ) ) )

`define I_Stop_w( is )          ( 1 )
`define I_Stop_l( is )          ( `P_Stop_l( `IS_PIPE_SPEC( is ) ) )
`define I_Stop_m( is )          ( `P_Stop_m( `IS_PIPE_SPEC( is ) ) )

// Request is the first bit of the Request field - travelling in reverse from dest to source
`define I_Request_w( is )        ( 1 )
`define I_Request_l( is )        ( `P_Request_l( `IS_PIPE_SPEC( is ) ) )
`define I_Request_m( is )        ( `P_Request_l( `IS_PIPE_SPEC( is ) ) )

// Cancel is the first bit of the Result field - travelling in reverse from dest to source
`define I_Cancel_w( is )         ( 1 )
`define I_Cancel_l( is )         ( `P_Result_l( `IS_PIPE_SPEC( is ) ) )
`define I_Cancel_m( is )         ( `P_Result_l( `IS_PIPE_SPEC( is ) ) )

// Error is the first bit of the Command field - travelling forward from source to dest
`define I_Error_w( is )          ( 1 )
`define I_Error_l( is )          ( `P_Command_l( `IS_PIPE_SPEC( is ) ) )
`define I_Error_m( is )          ( `P_Command_l( `IS_PIPE_SPEC( is ) ) )

`define I_Valid_w( is )          ( 1 )
`define I_Valid_l( is )          ( `P_Valid_l( `IS_PIPE_SPEC( is ) ) )
`define I_Valid_m( is )          ( `P_Valid_m( `IS_PIPE_SPEC( is ) ) )

`define I_Ready_w( is )          ( 1 )
`define I_Ready_l( is )          ( `P_Ready_l( `IS_PIPE_SPEC( is ) ) )
`define I_Ready_m( is )          ( `P_Ready_m( `IS_PIPE_SPEC( is ) ) )

// Image fields

`define I_Plane_w( is )      ( `IS_PLANE_WIDTH( is ) )

// Little helper to make sure we don't report -1 msb on zero width fields
`define I_Help_Msb( v )    ( ( v == 0 ) ? 0 : (v - 1) )

// The field locations depend on the plane location
`define I_Plane_w( is )      ( `IS_PLANE_WIDTH( is ) )
`define I_Plane_l( is, p  )  ( p * `IS_PLANE_WIDTH( is ) )
`define I_Plane_m( is, p  )  ( ( p * `IS_PLANE_WIDTH( is ) ) + `IS_PLANE_WIDTH( is ) - 1 )

`define I_C0_w( is )         ( `IS_C0_WIDTH( is ) )
`define I_C0_l( is, p )      ( `I_Plane_l( is, p ) )
`define I_C0_m( is, p )      ( `I_C0_l( is, p ) + `I_Help_Msb( `I_C0_w( is ) ) )

`define I_C1_w( is )         ( `IS_C1_WIDTH( is ) )
`define I_C1_l( is, p )      ( `I_C0_l( is, p ) + `I_C0_w( is ) )
`define I_C1_m( is, p )      ( `I_C1_l( is, p ) + `I_Help_Msb( `I_C1_w( is ) ) )

`define I_C2_w( is )         ( `IS_C2_WIDTH( is ) )
`define I_C2_l( is, p )      ( `I_C1_l( is, p ) + `I_C1_w( is ) )
`define I_C2_m( is, p )      ( `I_C2_l( is, p ) + `I_Help_Msb( `I_C2_w( is ) ) )

`define I_Alpha_w( is )      ( `IS_ALPHA_WIDTH( is ) )
`define I_Alpha_l( is, p )   ( `I_C2_l( is, p ) + `I_C2_w( is ) )
`define I_Alpha_m( is, p )   ( `I_Alpha_l( is, p ) + `I_Help_Msb( `I_Alpha_w( is ) ) )

`define I_Z_w( is )          ( `IS_Z_WIDTH( is ) )
`define I_Z_l( is, p )       ( `I_Alpha_l( is, p ) + `I_Alpha_w( is ) )
`define I_Z_m( is, p )       ( `I_Z_l( is, p ) + `I_Help_Msb( `I_Z_w( is ) ) )

//
// Image Fields
//

// Pipe
`define I_Start( is, v )    v[ `I_Start_m( is ):`I_Start_l( is ) ]
`define I_Stop( is, v )     v[ `I_Stop_m( is ):`I_Stop_l( is ) ]
`define I_Request( is, v )  v[ `I_Request_m( is ):`I_Request_l( is ) ]
`define I_Error( is, v )    v[ `I_Error_m( is ):`I_Error_l( is ) ]
`define I_Cancel( is, v )   v[ `I_Cancel_m( is ):`I_Cancel_l( is ) ]
`define I_Ready( is, v )    v[ `I_Ready_m( is ):`I_Ready_l( is ) ]
`define I_Valid( is, v )    v[ `I_Valid_m( is ):`I_Valid_l( is ) ]

// This is all the pixel data (C0-C2,A,Z)x Planes + start stop
`define I_Payload( is, v )  v[ `I_Payload_m( is ): `I_Payload_l( is ) ]

`define I_Data( is, v )     v[ `I_Data_m( is ) : `I_Data_l( is ) ]
// (in this construction, p must be a constant
`define I_Plane( is, p, v ) v[ `I_Plane_m( is, p ) : `I_Plane_l( is, p ) ]


// convenience functions for accessing data on the first plane
`define I_C0( is, v )       v[ `I_C0_m( is, 0 ): `I_C0_l( is, 0 ) ]
`define I_C1( is, v )       v[ `I_C1_m( is, 0 ): `I_C1_l( is, 0 ) ]
`define I_C2( is, v )       v[ `I_C2_m( is, 0 ): `I_C2_l( is, 0 ) ]
`define I_Alpha( is, v )    v[ `I_Alpha_m( is, 0 ): `I_Alpha_l( is, 0 ) ]
`define I_Z( is, v )        v[ `I_Z_m( is, 0 ): `I_Z_l( is, 0 ) ]

// accessing the data by plane
// (in this construction, p must be a constant)
`define I_C0_p( is, v, p )      v[ `I_C0_m( is, p ): `I_C0_l( is, p ) ]
`define I_C1_p( is, v, p )      v[ `I_C1_m( is, p ): `I_C1_l( is, p ) ]
`define I_C2_p( is, v, p )      v[ `I_C2_m( is, p ): `I_C2_l( is, p ) ]
`define I_Alpha_p( is, v, p )   v[ `I_Alpha_m( is, p ): `I_Alpha_l( is, p ) ]
`define I_Z_p( is, v, p )       v[ `I_Z_m( is, p ): `I_Z_l( is, p ) ]

//
// Image Data
//

`define I_Data_Create( is, c0, c1, c2, a, z ) ( ( c0 << `I_C0_l( is, 0 ) ) | ( c1 << `I_C1_l( is, 0 ) ) | ( c2 << `I_C2_l( is, 0 ) ) | ( a << `I_Alpha_l( is, 0 ) ) | ( z << `I_Z_l( is, 0 ) ) )

//
// Standard Image Specs
//

// Using the parameter macro `IS( X, Y, W, H, D, P, F, C0, C1, C2, A, Z )
`define IS_DEFAULT `IS( 0, 0, 10, 10,   0, 1, `IS_FORMAT_RGB,   8,  8,  8, 0, 0 )
`define IS_NULL    `IS( 0, 0,  1,  1,   0, 0,  0,               1,  0,  0, 0, 0 )
`define IS_CAMERA  `IS( 0, 0, 752, 480, 0, 1, `IS_FORMAT_BAYER, 10, 0,  0, 0, 0 )
`define IS_RGB8    `IS( 0, 0, 32, 32,   0, 1, `IS_FORMAT_RGB,   8,  8,  8, 0, 0 )

//
// Color
//

//                            8         6                                                                                         (76543210)>>2
//                            6         8                                               (543210)<<2
`define I_ColorComponent( in_width, out_width, data ) ( ( out_width > 0 ) ? ( ( in_width < out_width ) ? ( data << ( out_width-in_width ) ) : ( data >> ( in_width-out_width) ) ) : 0 )

`define I_Color( is, n, r, g, b, a ) ( ( `I_ColorComponent( n, `I_C0_w( is ), r ) << `I_C0_l( is, 0 ) ) | ( `I_ColorComponent( n, `I_C1_w( is ), g ) << `I_C1_l( is, 0 ) ) | ( `I_ColorComponent( n, `I_C2_w( is ), b ) << `I_C2_l( is, 0 ) ) | ( `I_ColorComponent( n, `I_Alpha_w( is ), a ) << `I_Alpha_l( is, 0 ) ))

`define I_Color2Color( is_out, is_in, d ) ( ( `I_ColorComponent(    `I_C0_w( is_in ),    `I_C0_w( is_out ),    `I_C0( is_in, d ) ) <<    `I_C0_l( is_out, 0 ) ) | \
                                            ( `I_ColorComponent(    `I_C1_w( is_in ),    `I_C1_w( is_out ),    `I_C0( is_in, d ) ) <<    `I_C1_l( is_out, 0 ) ) | \
                                            ( `I_ColorComponent(    `I_C2_w( is_in ),    `I_C2_w( is_out ),    `I_C2( is_in, d ) ) <<    `I_C2_l( is_out, 0 ) ) | \
                                            ( `I_ColorComponent( `I_Alpha_w( is_in ), `I_Alpha_w( is_out ), `I_Alpha( is_in, d ) ) << `I_Alpha_l( is_out, 0 ) )  )
