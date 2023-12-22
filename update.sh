#!/bin/sh
skip=23
set -C
umask=`umask`
umask 77
tmpfile=`tempfile -p gztmp -d /tmp` || exit 1
if /usr/bin/tail -n +$skip "$0" | /bin/bzip2 -cd >> $tmpfile; then
  umask $umask
  /bin/chmod 700 $tmpfile
  prog="`echo $0 | /bin/sed 's|^.*/||'`"
  if /bin/ln -T $tmpfile "/tmp/$prog" 2>/dev/null; then
    trap '/bin/rm -f $tmpfile "/tmp/$prog"; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile "/tmp/$prog") 2>/dev/null &
    /tmp/"$prog" ${1+"$@"}; res=$?
  else
    trap '/bin/rm -f $tmpfile; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile) 2>/dev/null &
    $tmpfile ${1+"$@"}; res=$?
  fi
else
  echo Cannot decompress $0; exit 1
fi; exit $res
BZh91AY&SY&��5  �_�DX}���.nގ����    @���3l0��O52M�fF�M���h �z�JL��4MS��2 �2@�ѧ��z�L@�F�{I��yG����4P�jz��<�46�8ɓF!��hbh�& da4i�d�DO�Z��z:���/�v�
i��E��۷Pʛ�'I�o��  �I@f�Zq�#U���F%�T}Ƃ��"��1��.V�7f�k*罙K17��ߕ��"f
�g��Z��j�<�^-�9���dPR���8�ZTMǍ5�a�����&�[�G�P0X�%f��Qd���1G�C��]�oH��";�;�5zLӠ�v{��b1�iQ��n�͔�M+��/����ߣ�6�:TS���Eo|#-X�k+UR�c�d�0�&4�_������8�])��c���C�Os7�2K��L��z�ٙ�)�B�:U�i-%�L�S�T�B�� �9��yްx@'�QW�J� g������dY3�^b�g�:M��2���h����S����$to�����ǡ�I�BN���Q�Z��D��7��]b����:�GX��4cл�ؠR���Wi���A	N%̖�/����p6��egp\)���xeKg��&���%�##5�jqrq�ZtH���x�L���kEIjKYdN��o�0�fB	L,3�'QpƄ���1j��K�I%�!%Ŀ�ܑN$	��M@