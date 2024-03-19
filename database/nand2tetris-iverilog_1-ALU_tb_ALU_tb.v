`default_nettype none
module ALU_tb();

    integer file;

    reg [15:0] x;
    reg [15:0] y;
    reg zx;
    reg nx;
    reg zy;
    reg ny;
    reg f;
    reg no;
    wire [15:0] out;
    wire zr;
    wire ng;

    ALU ALU(
        .x(x),
        .y(y),
        .zx(zx),
        .nx(nx),
        .zy(zy),
        .ny(ny),
        .f(f),
        .no(no),
        .out(out),
        .zr(zr),
        .ng(ng)
    );
      
    task display;
        #1 $fwrite(file, "| %16b | %16b | %1b | %1b | %1b | %1b | %1b | %1b | %16b | %1b | %1b |\n",x,y,zx,nx,zy,ny,f,no,out,zr,ng);
    endtask
      
    initial begin
        $dumpfile("ALU_tb.vcd");
         $dumpvars(0, ALU_tb);
        file = $fopen("ALU.out","w");
        $fwrite(file, "|        x         |        y         |zx |nx |zy |ny | f |no |       out        |zr |ng |\n");
        
        x = 16'b0000000000000000;  // x ==0
        y = 16'b1111111111111111;  // y = -1

        // Compute=0
        zx = 1;
        nx =0;
        zy=1;
        ny=0;
        f =1;
        no=0;
        display();

        // Compute 1
        zx=1;
        nx=1;
        zy=1;
        ny=1;
        f =1;
        no=1;

        display();


        // Compute -1
        zx=1;
        nx=1;
        zy=1;
        ny=0;
        f =1;
        no=0;

        display();

        // Compute x
        zx=0;
        nx=0;
        zy=1;
        ny=1;
        f =0;
        no=0;

        display();

        // Compute y
        zx=1;
        nx=1;
        zy=0;
        ny=0;
        f =0;
        no=0;

        display();

        // Compute !x
        zx=0;
        nx=0;
        zy=1;
        ny=1;
        f =0;
        no=1;

        display();

        // Compute !y
        zx=1;
        nx=1;
        zy=0;
        ny=0;
        f =0;
        no=1;

        display();

        // Compute -x
        zx=0;
        nx=0;
        zy=1;
        ny=1;
        f =1;
        no=1;

        display();

        // Compute -y
        zx=1;
        nx=1;
        zy=0;
        ny=0;
        f =1;
        no=1;

        display();

        // Compute x + 1
        zx=0;
        nx=1;
        zy=1;
        ny=1;
        f =1;
        no=1;

        display();

        // Compute y + 1
        zx=1;
        nx=1;
        zy=0;
        ny=1;
        f =1;
        no=1;

        display();

        // Compute x - 1
        zx=0;
        nx=0;
        zy=1;
        ny=1;
        f =1;
        no=0;

        display();

        // Compute y - 1
        zx=1;
        nx=1;
        zy=0;
        ny=0;
        f =1;
        no=0;

        display();


        // Compute x + y
        zx=0;
        nx=0;
        zy=0;
        ny=0;
        f =1;
        no=0;

        display();


        // Compute x - y
        zx=0;
        nx=1;
        zy=0;
        ny=0;
        f =1;
        no=1;

        display();

        // Compute y - x
        zx=0;
        nx=0;
        zy=0;
        ny=1;
        f =1;
        no=1;

        display();

        // Compute x & y
        zx=0;
        nx=0;
        zy=0;
        ny=0;
        f =0;
        no=0;

        display();

        // Compute x | y
        zx=0;
        nx=1;
        zy=0;
        ny=1;
        f =0;
        no=1;

        display();

        x=16'b000000000010001;  // x = 17
        y=16'b000000000000011;  // y =  3

        // Compute=0
        zx=1;
        nx=0;
        zy=1;
        ny=0;
        f =1;
        no=0;

        display();

        // Compute 1
        zx=1;
        nx=1;
        zy=1;
        ny=1;
        f =1;
        no=1;

        display();

        // Compute -1
        zx=1;
        nx=1;
        zy=1;
        ny=0;
        f =1;
        no=0;

        display();

        // Compute x
        zx=0;
        nx=0;
        zy=1;
        ny=1;
        f =0;
        no=0;

        display();

        // Compute y
        zx=1;
        nx=1;
        zy=0;
        ny=0;
        f =0;
        no=0;

        display();

        // Compute !x
        zx=0;
        nx=0;
        zy=1;
        ny=1;
        f =0;
        no=1;

        display();

        // Compute !y
        zx=1;
        nx=1;
        zy=0;
        ny=0;
        f =0;
        no=1;

        display();

        // Compute -x
        zx=0;
        nx=0;
        zy=1;
        ny=1;
        f =1;
        no=1;

        display();

        // Compute -y
        zx=1;
        nx=1;
        zy=0;
        ny=0;
        f =1;
        no=1;

        display();

        // Compute x + 1
        zx=0;
        nx=1;
        zy=1;
        ny=1;
        f =1;
        no=1;

        display();

        // Compute y + 1
        zx=1;
        nx=1;
        zy=0;
        ny=1;
        f =1;
        no=1;

        display();

        // Compute x - 1
        zx=0;
        nx=0;
        zy=1;
        ny=1;
        f =1;
        no=0;

        display();

        // Compute y - 1
        zx=1;
        nx=1;
        zy=0;
        ny=0;
        f =1;
        no=0;

        display();

        // Compute x + y
        zx=0;
        nx=0;
        zy=0;
        ny=0;
        f =1;
        no=0;

        display();

        // Compute x - y
        zx=0;
        nx=1;
        zy=0;
        ny=0;
        f =1;
        no=1;

        display();

        // Compute y - x
        zx=0;
        nx=0;
        zy=0;
        ny=1;
        f =1;
        no=1;

        display();

        // Compute x & y
        zx=0;
        nx=0;
        zy=0;
        ny=0;
        f =0;
        no=0;

        display();

        // Compute x | y
        zx=0;
        nx=1;
        zy=0;
        ny=1;
        f =0;
        no=1;

        display();

        $finish;
    end

endmodule
