module reg_file(A,B,A_addr,B_addr,C_addr,C,load,clock,clear);
	input [3:0] A_addr,B_addr,C_addr;
	output reg [15:0] A,B;
	input load,clock,clear;
	input [15:0] C;
	
	reg [15:0] regi_File [15:0];
	reg [15:0] regi_File_C [15:0];
	
	integer count2;
	always @(posedge clock,clear)
	begin
		if(clear==1'b1)
		begin
			for(count2=0;count2<16;count2=count2+1)
			begin
				regi_File[count2] = 16'b0; // assign Initial value as 0
				regi_File_C[count2] = 16'b0;
			end
		end	
	end
	
	always @(posedge clock,clear)
	begin
		if(load==1'b1)
			regi_File_C[C_addr] = C;
		else
		begin
			A = regi_File[A_addr]; //give the address to the Register file
			B = regi_File[B_addr];
		end
	end 
	
	integer count1;
	initial
	begin
		for(count1=0;count1<16;count1=count1+1)
		begin
			regi_File [count1] = count1[15:0];  
		end
	end
	
endmodule




module Test_Reg_file;
	wire [15:0] A,B;
	reg [3:0] A_addr,B_addr,C_addr;
	reg load,clock,clear;
	reg [15:0] C;
	
	initial 
		clock=1'b0;
		
	always
		#10 clock = ~clock;
		
	initial
		#1000 $finish;
	
	reg_file rf1(A,B,A_addr,B_addr,C_addr,C,load,clock,clear);
	
	initial
		begin
		#5 load=0; clear=0;A_addr[3]=0; A_addr[2]=0; A_addr[1]=1; A_addr[0]=1;   B_addr[3]=1; B_addr[2]=0; B_addr[1]=1; B_addr[0]=0;
		#1 $display("clear=%b,load=%b, A_addrr[3]=%b, A_addrr[2]=%b, A_addrr[1]=%b, A_addrr[0]=%b, B_addrr[3]=%b, B_addrr[2]=%b, B_addrr[1]=%b, B_addrr[0]=%b\n",clear,load,A_addr[3],A_addr[2],A_addr[1],A_addr[0],B_addr[3],B_addr[2],B_addr[1],B_addr[0]);
		#1 $display("A[15]=%b, A[14]=%b, A[13]=%b, A[12]=%b, A[11]=%b, A[10]=%b, A[9]=%b, A[8]=%b, A[7]=%b, A[6]=%b, A[5]=%b, A[4]=%b, A[3]=%b, A[2]=%b, A[1]=%b, A[0]=%b\n",A[15],A[14],A[13],A[12],A[11],A[10],A[9],A[8],A[7],A[6],A[5],A[4],A[3],A[2],A[1],A[0]);
		#1 $display("B[15]=%b, B[14]=%b, B[13]=%b, B[12]=%b, B[11]=%b, B[10]=%b, B[9]=%b, B[8]=%b, B[7]=%b, B[6]=%b, B[5]=%b, B[4]=%b, B[3]=%b, B[2]=%b, B[1]=%b, B[0]=%b\n\n",B[15],B[14],B[13],B[12],B[11],B[10],B[9],B[8],B[7],B[6],B[5],B[4],B[3],B[2],B[1],B[0]);
		
		#15  load=0; clear=0;A_addr[3]=1; A_addr[2]=0; A_addr[1]=1; A_addr[0]=0; B_addr[3]=1; B_addr[2]=0; B_addr[1]=1; B_addr[0]=1;
		#1 $display("clear=%b, load=%b, A_addrr[3]=%b, A_addrr[2]=%b, A_addrr[1]=%b, A_addrr[0]=%b, B_addrr[3]=%b, B_addrr[2]=%b, B_addrr[1]=%b, B_addrr[0]=%b\n",clear,load,A_addr[3],A_addr[2],A_addr[1],A_addr[0],B_addr[3],B_addr[2],B_addr[1],B_addr[0]);
		#1 $display("A[15]=%b, A[14]=%b, A[13]=%b, A[12]=%b, A[11]=%b, A[10]=%b, A[9]=%b, A[8]=%b, A[7]=%b, A[6]=%b, A[5]=%b, A[4]=%b, A[3]=%b, A[2]=%b, A[1]=%b, A[0]=%b\n",A[15],A[14],A[13],A[12],A[11],A[10],A[9],A[8],A[7],A[6],A[5],A[4],A[3],A[2],A[1],A[0]);
		#1 $display("B[15]=%b, B[14]=%b, B[13]=%b, B[12]=%b, B[11]=%b, B[10]=%b, B[9]=%b, B[8]=%b, B[7]=%b, B[6]=%b, B[5]=%b, B[4]=%b, B[3]=%b, B[2]=%b, B[1]=%b, B[0]=%b\n\n",B[15],B[14],B[13],B[12],B[11],B[10],B[9],B[8],B[7],B[6],B[5],B[4],B[3],B[2],B[1],B[0]);
	
		#8  load=1; clear=0;C_addr[3]=1; C_addr[2]=0; C_addr[1]=1; C_addr[0]=1;C[15]=0;C[14]=1;C[13]=1;C[12]=1;C[11]=0;C[10]=1;C[9]=0;C[8]=1;C[7]=1;C[6]=0;C[5]=1;C[4]=0;C[3]=0;C[2]=1;C[1]=0;C[0]=0;
		#1 $display("clear=%b, load=%b, C_addr[3]=%b, C_addr[2]=%b, C_addr[1]=%b, C_addr[0]=%b, C[15]=%b, C[14]=%b, C[13]=%b, C[12]=%b, C[11]=%b, C[10]=%b, C[9]=%b, C[8]=%b, C[7]=%b, C[6]=%b, C[5]=%b, C[4]=%b, C[3]=%b, C[2]=%b, C[1]=%b, C[0]=%b,\n",clear,load,C_addr[3],C_addr[2],C_addr[1],C_addr[0],C[15],C[14],C[13],C[12],C[11],C[10],C[9],C[8],C[7],C[6],C[5],C[4],C[3],C[2],C[1],C[0]);

		end
endmodule