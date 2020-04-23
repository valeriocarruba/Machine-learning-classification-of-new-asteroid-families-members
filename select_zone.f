      program select_hygiea

      double precision pi,degtorad
      double precision a,e,inc,n,g,s,M,H,dd,time,LE
      double precision a_h,e_h,sini_h,lim_a,lim_e,lim_i
      double precision a_min,a_max,i_min,i_max
      integer index
      character*12 idesig

CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
      open(11,file='input_region')
      open(1,file='afp.pro')
      open(2,file='afp.multi.pro')
      open(3,file='prop_el_all')
      
      pi=3.14159265358979
      degtorad=pi/180.

      do i=1,10
         read(11,*)
      enddo
      read(11,*) index

      if(index.lt.1) then
         write(*,*) 'Invalid choice of region'
         goto 999
      endif
      
      if(index.eq.1) then
         a_min=1.780
         a_max=2.253
      
         i_min=0.0
         i_max=0.9
      endif
      if(index.eq.2) then
         a_min=2.257
         a_max=2.465
      
         i_min=0.0
         i_max=0.3
      endif
      if(index.eq.3) then
         a_min=2.257
         a_max=2.465
      
         i_min=0.3
         i_max=0.7
      endif    
      if(index.eq.4) then
         a_min=2.520
         a_max=2.818
      
         i_min=0.0
         i_max=0.3
      endif
      if(index.eq.5) then
         a_min=2.520
         a_max=2.818
      
         i_min=0.3
         i_max=0.7
      endif
      if(index.eq.6) then
         a_min=2.832
         a_max=3.240
      
         i_min=0.0
         i_max=0.3
      endif
      if(index.eq.7) then
         a_min=2.832
         a_max=3.240
      
         i_min=0.3
         i_max=0.7
      endif
      if(index.eq.8) then
         a_min=3.290
         a_max=3.800
      
         i_min=0.0
         i_max=0.9
      endif
   
      if(index.gt.8) then
         write(*,*) 'Invalid choice of region'
         goto 999
      endif
      
      npro=0
 111  read(1,*,end=222)
      npro=npro+1
      goto 111
 222  continue
      rewind(1)
      
      do i=1,npro
         read(1,*) idesig,H,a,e,inc,n,g,s,LE,dd
c         write(*,*) idesig,H,a,e,inc,n,g,s,LE,dd
         
         if(a.gt.a_min) then
            if(a.le.a_max) then
               if(inc.gt.i_min) then
                  if(inc.le.i_max) then
                     write(3,778) idesig,a,e,inc,n,g,s,H,LE,idesig
                  endif
               endif
            endif
         endif
      enddo

      nmult=0
 112  read(2,*,end=223)
      nmult=nmult+1
      goto 112
 223  continue
      rewind(2)
      
      do j=1,nmult
         read(2,*) idesig,H,a,e,inc,n,g,s,LE
         if(a.gt.a_min) then
            if(a.le.a_max) then
               if(inc.gt.i_min) then
                  if(inc.gt.i_max) then
                     write(3,779) 600000+j,a,e,inc,n,g,s,H,LE,idesig
                  endif
               endif
            endif
         endif
      enddo
      
 777  format(6(f16.9,2x))
 778  format(a6,2x,6(f16.9,2x),2(f9.2,2x),a9)
 779  format(i6,2x,6(f16.9,2x),2(f9.2,2x),a9)
 999  end
