      program try1
      double precision a3,e3,sini3,H3,LCE3
      double precision a(350000),e(350000),sini(350000),dist
      integer idesig3,idesig(350000),flag(350000),ifam(350000)
      
CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC

      open(1,file='fam_nov')
      open(2,file='prop_el_all')
      open(3,file='family_test')
      open(4,file='back_test')
      open(5,file='input_data')
      open(11,file='fam_large')
      
      AU=1.49597870e11 
      GAUSS= 0.01720209895
      GM=GAUSS*GAUSS*365.25*365.25
      FACTOR=AU/365.25/86400.
      sqrfac=FACTOR**2
      YEAR=365.25

      
      do i=1,3
         read(1,*)
      enddo
      nfam=0
 111  read(1,*,end=221) idesig3,a3,e3,sini3,H3
      nfam=nfam+1
      ifam(nfam)=idesig3
      write(11,777) idesig3,a3,e3,sini3,H3
      goto 111
 221  continue

c      write(*,*) idesig3,ifam(nfam),nfam
      n1=1
 112  read(2,*,end=222) idesig(n1),a(n1),e(n1),sini(n1)

      flag(n1)=0
      if(idesig(n1).eq.idesig3) then
         n2=n1
      endif
      do i=1,nfam
         if(idesig(n1).eq.ifam(i)) then
            flag(n1)=1.0
         endif
      enddo
      n1=n1+1
      goto 112
 222  continue
C     WRITE DATA TO FAMILY FILE
C     PUT AN EXTRA LINE HERE      
      
      if(idesig(1).le.9) then
         write(3,771) idesig(1),a(1),e(1),sini(1),flag(1)
      endif
      if(idesig(1).gt.9) then
         if(idesig(1).le.99) then
            write(3,772) idesig(1),a(1),e(1),sini(1),flag(1)
         endif
      endif
      if(idesig(1).gt.99) then
         if(idesig(1).le.999) then
            write(3,773) idesig(1),a(1),e(1),sini(1),flag(1)
         endif
      endif
      if(idesig(1).gt.999) then
         if(idesig(1).le.9999) then
            write(3,774) idesig(1),a(1),e(1),sini(1),flag(1)
         endif
      endif
      if(idesig(1).gt.9999) then
         if(idesig(1).le.99999) then
            write(3,775) idesig(1),a(1),e(1),sini(1),flag(1)
         endif
      endif
      if(idesig(1).gt.99999) then
         if(idesig(1).le.999999) then
            write(3,776) idesig(1),a(1),e(1),sini(1),flag(1)
         endif
      endif
         
      do i=1,n2
         if(idesig(i).le.9) then
            write(3,771) idesig(i),a(i),e(i),sini(i),flag(i)
         endif
         if(idesig(i).gt.9) then
            if(idesig(i).le.99) then
               write(3,772) idesig(i),a(i),e(i),sini(i),flag(i)
            endif
         endif
         if(idesig(i).gt.99) then
            if(idesig(i).le.999) then
               write(3,773) idesig(i),a(i),e(i),sini(i),flag(i)
            endif
         endif
         if(idesig(i).gt.999) then
            if(idesig(i).le.9999) then
               write(3,774) idesig(i),a(i),e(i),sini(i),flag(i)
            endif
         endif
         if(idesig(i).gt.9999) then
            if(idesig(i).le.99999) then
               write(3,775) idesig(i),a(i),e(i),sini(i),flag(i)
            endif
         endif
         if(idesig(i).gt.99999) then
            if(idesig(i).le.999999) then
               write(3,776) idesig(i),a(i),e(i),sini(i),flag(i)
            endif
         endif
         
      enddo
C     WRITE DATA TO THE BACKGROUND FILE
      
c      write(4,776) idesig(n2+1),a(n2+1),e(n2+1),sini(n2+1),flag(n2+1)

      nn=n2+1
      if(idesig(nn).le.9) then
         write(4,771) idesig(nn),a(nn),e(nn),sini(nn),flag(nn)
      endif
      if(idesig(nn).gt.9) then
         if(idesig(nn).le.99) then
            write(4,772) idesig(nn),a(nn),e(nn),sini(nn),flag(nn)
         endif
      endif
      if(idesig(nn).gt.99) then
         if(idesig(nn).le.999) then
            write(4,773) idesig(nn),a(nn),e(nn),sini(nn),flag(nn)
         endif
      endif
      if(idesig(nn).gt.999) then
         if(idesig(nn).le.9999) then
            write(4,774) idesig(nn),a(nn),e(nn),sini(nn),flag(nn)
         endif
      endif
      if(idesig(nn).gt.9999) then
         if(idesig(nn).le.99999) then
            write(4,775) idesig(nn),a(nn),e(nn),sini(nn),flag(nn)
         endif
      endif
      if(idesig(nn).gt.99999) then
         if(idesig(nn).le.999999) then
            write(4,776) idesig(nn),a(nn),e(nn),sini(nn),flag(nn)
         endif
      endif
         
      do i=n2+1,n1-1
                  if(idesig(i).le.9) then
            write(4,771) idesig(i),a(i),e(i),sini(i),flag(i)
         endif
         if(idesig(i).gt.9) then
            if(idesig(i).le.99) then
               write(4,772) idesig(i),a(i),e(i),sini(i),flag(i)
            endif
         endif
         if(idesig(i).gt.99) then
            if(idesig(i).le.999) then
               write(4,773) idesig(i),a(i),e(i),sini(i),flag(i)
            endif
         endif
         if(idesig(i).gt.999) then
            if(idesig(i).le.9999) then
               write(4,774) idesig(i),a(i),e(i),sini(i),flag(i)
            endif
         endif
         if(idesig(i).gt.9999) then
            if(idesig(i).le.99999) then
               write(4,775) idesig(i),a(i),e(i),sini(i),flag(i)
            endif
         endif
         if(idesig(i).gt.99999) then
            if(idesig(i).le.999999) then
               write(4,776) idesig(i),a(i),e(i),sini(i),flag(i)
            endif
         endif
      enddo
C     WRITE NUMBER OF LINES IN THE INPUT FILES.
      
      write(5,*)
      write(5,*) n1,n2
      
 771  format(i1,1x,3(f9.7,1x),i1)
 772  format(i2,1x,3(f9.7,1x),i1)
 773  format(i3,1x,3(f9.7,1x),i1)
 774  format(i4,1x,3(f9.7,1x),i1)
 775  format(i5,1x,3(f9.7,1x),i1)
 776  format(i6,1x,3(f9.7,1x),i1)
 777  format(i6,1x,3(f9.7,1x),f6.2)
      end
