// This program was cloned from: https://github.com/johnwinans/Verilog-Examples
// License: GNU General Public License v3.0

`timescale 10ns/1ns

module tb();

    reg         a;
    reg         b;

    initial begin
        $dumpfile("top_tb.vcd");    // where to write the dump
        $dumpvars;                  // dump EVERYTHING

        a = 'bx;
        #1;
        if ( a )
            $display( "%b is true", a );
        else
            $display( "%b is false", a );

        a = 'bz;
        #1;
        if ( a )
            $display( "%b is true", a );
        else
            $display( "%b is false", a );

        a = 'b0;
        #1;
        if ( a )
            $display( "%b is true", a );
        else
            $display( "%b is false", a );

        a = 'b1;
        #1;
        if ( a )
            $display( "%b is true", a );
        else
            $display( "%b is false", a );

        $display();
        $display("**********************");

        a = 'bx;
        b = 'bx;
        #1;
        if ( a == b )
            $display( "%b == %b  is true", a, b );
        else
            $display( "%b == %b  is false", a, b );
        if ( a != b )
            $display( "%b != %b  is true", a, b );
        else
            $display( "%b != %b  is false", a, b );
        if ( a === b)
            $display( "%b === %b is true", a, b );
        else
            $display( "%b === %b is false", a, b );
        if ( a !== b)
            $display( "%b !== %b is true", a, b );
        else
            $display( "%b !== %b is false", a, b );

        $display();
        a = 0;
        #1;
        if ( a == b )
            $display( "%b == %b  is true", a, b );
        else
            $display( "%b == %b  is false", a, b );
        if ( a != b )
            $display( "%b != %b  is true", a, b );
        else
            $display( "%b != %b  is false", a, b );
        if ( a === b)
            $display( "%b === %b is true", a, b );
        else
            $display( "%b === %b is false", a, b );
        if ( a !== b)
            $display( "%b !== %b is true", a, b );
        else
            $display( "%b !== %b is false", a, b );

        $display();
        b = 0;
        #1;
        if ( a == b )
            $display( "%b == %b  is true", a, b );
        else
            $display( "%b == %b  is false", a, b );
        if ( a != b )
            $display( "%b != %b  is true", a, b );
        else
            $display( "%b != %b  is false", a, b );
        if ( a === b)
            $display( "%b === %b is true", a, b );
        else
            $display( "%b === %b is false", a, b );
        if ( a !== b)
            $display( "%b !== %b is true", a, b );
        else
            $display( "%b !== %b is false", a, b );

        $display();
        a = 'bz;
        #1;
        if ( a == b )
            $display( "%b == %b  is true", a, b );
        else
            $display( "%b == %b  is false", a, b );
        if ( a != b )
            $display( "%b != %b  is true", a, b );
        else
            $display( "%b != %b  is false", a, b );
        if ( a === b)
            $display( "%b === %b is true", a, b );
        else
            $display( "%b === %b is false", a, b );
        if ( a !== b)
            $display( "%b !== %b is true", a, b );
        else
            $display( "%b !== %b is false", a, b );

        $display();
        b = 'bz;
        #1;
        if ( a == b )
            $display( "%b == %b  is true", a, b );
        else
            $display( "%b == %b  is false", a, b );
        if ( a != b )
            $display( "%b != %b  is true", a, b );
        else
            $display( "%b != %b  is false", a, b );
        if ( a === b)
            $display( "%b === %b is true", a, b );
        else
            $display( "%b === %b is false", a, b );
        if ( a !== b)
            $display( "%b !== %b is true", a, b );
        else
            $display( "%b !== %b is false", a, b );

        $display();
        a = 1;
        #1;
        if ( a == b )
            $display( "%b == %b  is true", a, b );
        else
            $display( "%b == %b  is false", a, b );
        if ( a != b )
            $display( "%b != %b  is true", a, b );
        else
            $display( "%b != %b  is false", a, b );
        if ( a === b)
            $display( "%b === %b is true", a, b );
        else
            $display( "%b === %b is false", a, b );
        if ( a !== b)
            $display( "%b !== %b is true", a, b );
        else
            $display( "%b !== %b is false", a, b );

        $display();
        b = 1;
        #1;
        if ( a == b )
            $display( "%b == %b  is true", a, b );
        else
            $display( "%b == %b  is false", a, b );
        if ( a != b )
            $display( "%b != %b  is true", a, b );
        else
            $display( "%b != %b  is false", a, b );
        if ( a === b)
            $display( "%b === %b is true", a, b );
        else
            $display( "%b === %b is false", a, b );
        if ( a !== b)
            $display( "%b !== %b is true", a, b );
        else
            $display( "%b !== %b is false", a, b );

        $display();
        a = 0;
        #1;
        if ( a == b )
            $display( "%b == %b  is true", a, b );
        else
            $display( "%b == %b  is false", a, b );
        if ( a != b )
            $display( "%b != %b  is true", a, b );
        else
            $display( "%b != %b  is false", a, b );
        if ( a === b)
            $display( "%b === %b is true", a, b );
        else
            $display( "%b === %b is false", a, b );
        if ( a !== b)
            $display( "%b !== %b is true", a, b );
        else
            $display( "%b !== %b is false", a, b );

        $display();
        if ( ( 'bx == 'bx ) === ( 'bx != 'bx ) )
            $display( "( 'bx == 'bx ) === ( 'bx != 'bx )  is true" );
        else
            $display( "( 'bx == 'bx ) === ( 'bx != 'bx )  is false" );
        
        $finish;
    end

endmodule
