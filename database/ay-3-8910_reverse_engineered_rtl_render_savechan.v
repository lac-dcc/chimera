// (c) 2019 lvd

// This is system verilog class used to write sound dump files

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


package SaveChan;

class save_chan;

	int fd;

	function new();
		fd=0;
	endfunction


	task open_file(string filename);

		fd = $fopen(filename,"wb");

	endtask


	task add_data(bit [15:0] data);

		$fwrite(fd, "%c%c", data[7:0],data[15:8]);

	endtask


	task finish();

		$fclose(fd);

	endtask



endclass












endpackage

