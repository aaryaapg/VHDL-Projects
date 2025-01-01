----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Aaryaa Padhyegurjar
-- 
-- Create Date:    22:03:28 05/06/2020 
-- Design Name: 
-- Module Name:    LEDSwitching - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity LEDSwitching is
port (Sw1 : in std_logic;
		Sw2 : in std_logic;
		led1 : out std_logic;
		led2 : out std_logic);
end LEDSwitching;

architecture Behavioral of LEDSwitching is

begin
led1 <= Sw1;
led2 <= Sw2;

end Behavioral;

