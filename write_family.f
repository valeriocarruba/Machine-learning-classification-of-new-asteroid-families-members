      program try2
      double precision a,e,sini,nn,g,s,H,L,flag
      integer idesig
      character*12 ide   
CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
      open(1,file='prop_el_all')
      open(2,file='results.dat')
      open(3,file='input_data')
      open(4,file='fam_ext')
      
      read(3,*)
      read(3,*) n1, n2

      do i=1,n2
         read(1,*)idesig
      enddo
c      write(*,*) idesig
      do i=1,n1-n2-2
         read(2,*) flag
         read(1,*) idesig,a,e,sini,nn,g,s,H,L,ide
         if(flag.eq.1.0) then
            write(4,777) idesig,a,e,sini,nn,g,s,H,L
c            write(*,777) idesig,a,e,sini,nn,g,s,H,L,ide
         endif
      enddo
 777  format(i6,2x,6(f11.6,2x),2(f10.2,2x),a9,2x,f6.3)    
      end
