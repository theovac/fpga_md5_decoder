library ieee;
library std;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
use std.textio.all; -- include package stdio.vhd
use ieee.std_logic_arith.all;


entity write_txt is
port(
	clk : in std_logic;
	received_data : in real;
	end_of_file : in std_logic
	);
end write_txt;


architecture rtl of write_txt is

-- the number of the line of the file to which we write or read
signal line_number : integer := 1;

begin 

process(clk)
	file outfile : text is out "answer.txt"; -- here we declare the txt output
	variable outline : line -- line number declaration
begin 

if rising_edge(clk) then
	if (end_of_file = '1') then
		-- write in the outline the data we received
		write(outline,received_data,right,16,12);
		--write line to output txt file
		writeline(outfile,outline);
		line_number <= line_number + 1;
	else 
	null;
	end if;
end if;
end process;

end rtl;