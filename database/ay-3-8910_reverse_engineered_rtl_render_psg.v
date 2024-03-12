// (c) 2019 lvd

// This is system verilog classes used to parse .psg files.

/*  This file is part of AY-3-8910 restoration and preservation project.

    AY-3-8910 restoration and preservation project is free software: you
    can redistribute it and/or modify it under the terms of the
    GNU General Public License as published by the Free Software Foundation,
    either version 3 of the License, or (at your option) any later version.

    AY-3-8910 restoration and preservation project is distributed in the
    hope that it will be useful, but WITHOUT ANY WARRANTY; without even
    the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
    PURPOSE. See the GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with Foobar.  If not, see <https://www.gnu.org/licenses/>.
*/

package Psg;



class psg_regs;

	bit [15:0] update;
	byte       value   [0:15];

	function new();
		int i;
		for(i=0;i<16;i++)
		begin
			update[i] = 1'b0;
			value [i] = 8'd0;
		end
	endfunction
endclass



class psg_dump;

	psg_regs dump[$];

	function new();
		dump = {};
	endfunction

	extern task load_psg(string filename);
endclass



task psg_dump::load_psg(string filename);

	int fd;
	byte psg_array[];
	int fsize,tmp,i;
	byte tbyte;

	psg_regs prev;
	psg_regs curr;
	psg_regs empty;
	psg_regs clregs;
	
	int ptr;
	byte p;
	bit [7:0] v;

	int pause;

	
	
	fd = $fopen(filename,"rb");

	// get size of file
	tmp=$fseek(fd,0,2);
	fsize=$ftell(fd);
//$display("filesize=%d",fsize);
	tmp=$rewind(fd);
//$display("filepos=%d",$ftell(fd));

	// allocate an array for the given size
	psg_array = new[fsize];

	// read into array
	for(i=0;i<fsize;i++)
	begin
		tmp=$fread(tbyte,fd);
		psg_array[i]=tbyte;
	end

	$fclose(fd);

//$display("%p",psg_array);
//$display("arr size: %d",psg_array.size());


	// parse PSG and generate psg_regs objects
	dump.delete();


	// empty element: no regs updated
	empty = new; // properly initialized by constructor


	// generate first element of the dump that clears all regs
	clregs = new;
	prev = new;
	for(i=0;i<16;i++)
	begin
		clregs.value[i]  = 8'd0; prev.value[i]  = 8'd0;
		clregs.update[i] = 1'b1; prev.update[i] = 1'b1;
	end
	dump.push_back(clregs);

	// parse PSG
	ptr=16;
	pause=0;
	while( ptr<fsize )
	begin
		p = psg_array[ptr];

		if( p==8'hFF )
		begin
			pause++;
			ptr++;
		end
		else if( p==8'hFE )
		begin
			ptr++;
			v=psg_array[ptr++];
			pause=pause+v*4;
		end
		else if( p==8'hFD ) // end-of-file
		begin
			ptr=fsize; // early exit
		end
		else if( !(p&8'hF0) )
		begin
			curr = new;

			// get new register values into 'curr'
			begin : registers_loop
			forever
			begin
				if( ptr>=fsize || (psg_array[ptr]&8'hF0) )
					disable registers_loop;

				p=psg_array[ptr++];
				v=psg_array[ptr++];

				curr.update[p] = 1'b1;
				curr.value[p] = v;
			end
			end

			// filter 'curr' over 'prev'
			for(i=0;i<16;i++)
			begin
				if( curr.update[i] && i!=13 )
				begin
					if( curr.value[i]==prev.value[i] )
						curr.update[i] = 1'b0;
					else
					begin
						prev.value[i] = curr.value[i];
					end
				end
			end

			// add to dump: first pause, if it was >1, then registers
			if( pause>1 )
			begin
				for(i=1;i<pause;i++)
					dump.push_back(empty);
			end
			pause=0;

			dump.push_back(curr);
		end
		else
		begin
			$display("Wrong byte from PSG file: %x at position %x (%d)",p,ptr-1,ptr-1);
			$stop;
		end
	end

	// the end
	dump.push_back(empty);
	dump.push_back(empty);


endtask




endpackage

