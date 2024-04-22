library IEEE;
use IEEE.std_logic_1164.all;

use work.constants.all;
use work.types.all;


entity angle_to_coord is
    port (
        angle: in int;
        coord: out vec2i_t
    );
end entity;


architecture Behavioral of angle_to_coord is
    signal x_mapped, y_mapped: int;   -- [0, ANGLE_EIGHTH], i.e. [0, 158]
    signal x_inverse, y_inverse, xy_inverse: std_logic;
    signal coord_rev: vec2i_t;
begin
    process (angle) is
        variable ang: int;
    begin
        x_inverse <= '0';
        y_inverse <= '0';
        xy_inverse <= '0';
        ang := angle mod ANGLE_MODULO;
        if ang > ANGLE_HALF then
            ang := ANGLE_MODULO - ang;
            y_inverse <= '1';
        end if;
        if ang > ANGLE_QUARTER then
            ang := ANGLE_HALF - ang;
            x_inverse <= '1';
        end if;
        if ang > ANGLE_EIGHTH then
            ang := ANGLE_QUARTER - ang;
            xy_inverse <= '1';
        end if;
        y_mapped <= ang;
    end process;

    x_mapped <=
		225	when y_mapped >= 0 and y_mapped <= 13 else
		224	when y_mapped >= 14 and y_mapped <= 24 else
		223	when y_mapped >= 25 and y_mapped <= 33 else
		222	when y_mapped >= 34 and y_mapped <= 38 else
		221	when y_mapped >= 39 and y_mapped <= 44 else
		220	when y_mapped >= 45 and y_mapped <= 48 else
		219	when y_mapped >= 49 and y_mapped <= 53 else
		218	when y_mapped >= 54 and y_mapped <= 57 else
		217	when y_mapped >= 58 and y_mapped <= 60 else
		216	when y_mapped >= 61 and y_mapped <= 64 else
		215	when y_mapped >= 65 and y_mapped <= 67 else
		214	when y_mapped >= 68 and y_mapped <= 70 else
		213	when y_mapped >= 71 and y_mapped <= 73 else
		212	when y_mapped >= 74 and y_mapped <= 76 else
		211	when y_mapped = 77 or y_mapped = 78 else
		210	when y_mapped >= 79 and y_mapped <= 81 else
		209	when y_mapped >= 82 and y_mapped <= 84 else
		208	when y_mapped = 85 or y_mapped = 86 else
		207	when y_mapped = 87 or y_mapped = 88 else
		206	when y_mapped >= 89 and y_mapped <= 91 else
		205	when y_mapped = 92 or y_mapped = 93 else
		204	when y_mapped = 94 or y_mapped = 95 else
		203	when y_mapped = 96 or y_mapped = 97 else
		202	when y_mapped = 98 or y_mapped = 99 else
		201	when y_mapped = 100 or y_mapped = 101 else
		200	when y_mapped = 102 or y_mapped = 103 else
		199	when y_mapped = 104 or y_mapped = 105 else
		198	when y_mapped = 106 or y_mapped = 107 else
		197	when y_mapped = 108 else
		196	when y_mapped = 109 or y_mapped = 110 else
		195	when y_mapped = 111 or y_mapped = 112 else
		194	when y_mapped = 113 or y_mapped = 114 else
		193	when y_mapped = 115 else
		192	when y_mapped = 116 or y_mapped = 117 else
		191	when y_mapped = 118 or y_mapped = 119 else
		190	when y_mapped = 120 else
		189	when y_mapped = 121 or y_mapped = 122 else
		188	when y_mapped = 123 else
		187	when y_mapped = 124 or y_mapped = 125 else
		186	when y_mapped = 126 else
		185	when y_mapped = 127 or y_mapped = 128 else
		184	when y_mapped = 129 else
		183	when y_mapped = 130 else
		182	when y_mapped = 131 or y_mapped = 132 else
		181	when y_mapped = 133 else
		180	when y_mapped = 134 else
		179	when y_mapped = 135 or y_mapped = 136 else
		178	when y_mapped = 137 else
		177	when y_mapped = 138 else
		176	when y_mapped = 139 or y_mapped = 140 else
		175	when y_mapped = 141 else
		174	when y_mapped = 142 else
		173	when y_mapped = 143 else
		172	when y_mapped = 144 else
		171	when y_mapped = 145 or y_mapped = 146 else
		170	when y_mapped = 147 else
		169	when y_mapped = 148 else
		168	when y_mapped = 149 else
		167	when y_mapped = 150 else
		166	when y_mapped = 151 else
		165	when y_mapped = 152 else
		164	when y_mapped = 153 else
		163	when y_mapped = 154 else
		162	when y_mapped = 155 else
		161	when y_mapped = 156 else
		160	when y_mapped = 157 else
		159; -- when y_mapped = 158;

    coord_rev <= (x_mapped, y_mapped) when xy_inverse = '0' else (y_mapped, x_mapped);
    coord.x <= coord_rev.x when x_inverse = '0' else -coord_rev.x;
	coord.y <= coord_rev.y when y_inverse = '0' else -coord_rev.y;
end architecture;
