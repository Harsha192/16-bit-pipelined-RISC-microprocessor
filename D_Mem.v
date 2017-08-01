module dm(Read_Data,Write_Data,Address,MW,MR);
	
	input [15:0] Address,Write_Data;
	input MW,MR;
	
	reg [15:0] temperary [15:0];
	output reg [15:0] Read_Data;    

	always @(MW,MR)
		begin
			
			if(MW == 1)         
				temperary[Address] = Write_Data[15:0];
			if(MR == 1)     
				Read_Data[15:0] = temperary[Address];
		end

endmodule


module Test_D_Mem;

	reg [15:0] Address,Write_Data;
	reg MW,MR;
	wire [15:0] Read_Data;

	dm mydm(Read_Data,Write_Data,Address,MW,MR);

	initial
		begin
			Write_Data=16'b0000000000000011;Address=16'b0000000000000101;MW=1;    
			#5 $display("Address = %b MW=%b Write_Data = %b",Address,MW,Write_Data);	
			Address=16'b0000000000000101;MR=1;                      
			#10 $display("Address = %b MR=%b Read_Data = %b",Address,MR,Read_Data);

		end
endmodule