
_rm:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char *argv[])
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	83 ec 20             	sub    $0x20,%esp
  int i;

  if(argc < 2){
   9:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
   d:	7f 19                	jg     28 <main+0x28>
    printf(2, "Usage: rm files...\n");
   f:	c7 44 24 04 68 09 00 	movl   $0x968,0x4(%esp)
  16:	00 
  17:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  1e:	e8 79 05 00 00       	call   59c <printf>
    exit();
  23:	e8 ec 03 00 00       	call   414 <exit>
  }

  for(i = 1; i < argc; i++){
  28:	c7 44 24 1c 01 00 00 	movl   $0x1,0x1c(%esp)
  2f:	00 
  30:	eb 4f                	jmp    81 <main+0x81>
    if(unlink(argv[i]) < 0){
  32:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  36:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  3d:	8b 45 0c             	mov    0xc(%ebp),%eax
  40:	01 d0                	add    %edx,%eax
  42:	8b 00                	mov    (%eax),%eax
  44:	89 04 24             	mov    %eax,(%esp)
  47:	e8 18 04 00 00       	call   464 <unlink>
  4c:	85 c0                	test   %eax,%eax
  4e:	79 2c                	jns    7c <main+0x7c>
      printf(2, "rm: %s failed to delete\n", argv[i]);
  50:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  54:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  5b:	8b 45 0c             	mov    0xc(%ebp),%eax
  5e:	01 d0                	add    %edx,%eax
  60:	8b 00                	mov    (%eax),%eax
  62:	89 44 24 08          	mov    %eax,0x8(%esp)
  66:	c7 44 24 04 7c 09 00 	movl   $0x97c,0x4(%esp)
  6d:	00 
  6e:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  75:	e8 22 05 00 00       	call   59c <printf>
      break;
  7a:	eb 0e                	jmp    8a <main+0x8a>
  for(i = 1; i < argc; i++){
  7c:	83 44 24 1c 01       	addl   $0x1,0x1c(%esp)
  81:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  85:	3b 45 08             	cmp    0x8(%ebp),%eax
  88:	7c a8                	jl     32 <main+0x32>
    }
  }

  exit();
  8a:	e8 85 03 00 00       	call   414 <exit>

0000008f <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  8f:	55                   	push   %ebp
  90:	89 e5                	mov    %esp,%ebp
  92:	57                   	push   %edi
  93:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  94:	8b 4d 08             	mov    0x8(%ebp),%ecx
  97:	8b 55 10             	mov    0x10(%ebp),%edx
  9a:	8b 45 0c             	mov    0xc(%ebp),%eax
  9d:	89 cb                	mov    %ecx,%ebx
  9f:	89 df                	mov    %ebx,%edi
  a1:	89 d1                	mov    %edx,%ecx
  a3:	fc                   	cld    
  a4:	f3 aa                	rep stos %al,%es:(%edi)
  a6:	89 ca                	mov    %ecx,%edx
  a8:	89 fb                	mov    %edi,%ebx
  aa:	89 5d 08             	mov    %ebx,0x8(%ebp)
  ad:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  b0:	5b                   	pop    %ebx
  b1:	5f                   	pop    %edi
  b2:	5d                   	pop    %ebp
  b3:	c3                   	ret    

000000b4 <strcpy>:
#include "user.h"
#include "x86.h"
#include "pstat.h"
char*
strcpy(char *s, const char *t)
{
  b4:	55                   	push   %ebp
  b5:	89 e5                	mov    %esp,%ebp
  b7:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  ba:	8b 45 08             	mov    0x8(%ebp),%eax
  bd:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
  c0:	90                   	nop
  c1:	8b 45 08             	mov    0x8(%ebp),%eax
  c4:	8d 50 01             	lea    0x1(%eax),%edx
  c7:	89 55 08             	mov    %edx,0x8(%ebp)
  ca:	8b 55 0c             	mov    0xc(%ebp),%edx
  cd:	8d 4a 01             	lea    0x1(%edx),%ecx
  d0:	89 4d 0c             	mov    %ecx,0xc(%ebp)
  d3:	0f b6 12             	movzbl (%edx),%edx
  d6:	88 10                	mov    %dl,(%eax)
  d8:	0f b6 00             	movzbl (%eax),%eax
  db:	84 c0                	test   %al,%al
  dd:	75 e2                	jne    c1 <strcpy+0xd>
    ;
  return os;
  df:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  e2:	c9                   	leave  
  e3:	c3                   	ret    

000000e4 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  e4:	55                   	push   %ebp
  e5:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
  e7:	eb 08                	jmp    f1 <strcmp+0xd>
    p++, q++;
  e9:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  ed:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
  f1:	8b 45 08             	mov    0x8(%ebp),%eax
  f4:	0f b6 00             	movzbl (%eax),%eax
  f7:	84 c0                	test   %al,%al
  f9:	74 10                	je     10b <strcmp+0x27>
  fb:	8b 45 08             	mov    0x8(%ebp),%eax
  fe:	0f b6 10             	movzbl (%eax),%edx
 101:	8b 45 0c             	mov    0xc(%ebp),%eax
 104:	0f b6 00             	movzbl (%eax),%eax
 107:	38 c2                	cmp    %al,%dl
 109:	74 de                	je     e9 <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
 10b:	8b 45 08             	mov    0x8(%ebp),%eax
 10e:	0f b6 00             	movzbl (%eax),%eax
 111:	0f b6 d0             	movzbl %al,%edx
 114:	8b 45 0c             	mov    0xc(%ebp),%eax
 117:	0f b6 00             	movzbl (%eax),%eax
 11a:	0f b6 c0             	movzbl %al,%eax
 11d:	29 c2                	sub    %eax,%edx
 11f:	89 d0                	mov    %edx,%eax
}
 121:	5d                   	pop    %ebp
 122:	c3                   	ret    

00000123 <strlen>:

uint
strlen(const char *s)
{
 123:	55                   	push   %ebp
 124:	89 e5                	mov    %esp,%ebp
 126:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 129:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 130:	eb 04                	jmp    136 <strlen+0x13>
 132:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 136:	8b 55 fc             	mov    -0x4(%ebp),%edx
 139:	8b 45 08             	mov    0x8(%ebp),%eax
 13c:	01 d0                	add    %edx,%eax
 13e:	0f b6 00             	movzbl (%eax),%eax
 141:	84 c0                	test   %al,%al
 143:	75 ed                	jne    132 <strlen+0xf>
    ;
  return n;
 145:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 148:	c9                   	leave  
 149:	c3                   	ret    

0000014a <memset>:

void*
memset(void *dst, int c, uint n)
{
 14a:	55                   	push   %ebp
 14b:	89 e5                	mov    %esp,%ebp
 14d:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 150:	8b 45 10             	mov    0x10(%ebp),%eax
 153:	89 44 24 08          	mov    %eax,0x8(%esp)
 157:	8b 45 0c             	mov    0xc(%ebp),%eax
 15a:	89 44 24 04          	mov    %eax,0x4(%esp)
 15e:	8b 45 08             	mov    0x8(%ebp),%eax
 161:	89 04 24             	mov    %eax,(%esp)
 164:	e8 26 ff ff ff       	call   8f <stosb>
  return dst;
 169:	8b 45 08             	mov    0x8(%ebp),%eax
}
 16c:	c9                   	leave  
 16d:	c3                   	ret    

0000016e <strchr>:

char*
strchr(const char *s, char c)
{
 16e:	55                   	push   %ebp
 16f:	89 e5                	mov    %esp,%ebp
 171:	83 ec 04             	sub    $0x4,%esp
 174:	8b 45 0c             	mov    0xc(%ebp),%eax
 177:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 17a:	eb 14                	jmp    190 <strchr+0x22>
    if(*s == c)
 17c:	8b 45 08             	mov    0x8(%ebp),%eax
 17f:	0f b6 00             	movzbl (%eax),%eax
 182:	3a 45 fc             	cmp    -0x4(%ebp),%al
 185:	75 05                	jne    18c <strchr+0x1e>
      return (char*)s;
 187:	8b 45 08             	mov    0x8(%ebp),%eax
 18a:	eb 13                	jmp    19f <strchr+0x31>
  for(; *s; s++)
 18c:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 190:	8b 45 08             	mov    0x8(%ebp),%eax
 193:	0f b6 00             	movzbl (%eax),%eax
 196:	84 c0                	test   %al,%al
 198:	75 e2                	jne    17c <strchr+0xe>
  return 0;
 19a:	b8 00 00 00 00       	mov    $0x0,%eax
}
 19f:	c9                   	leave  
 1a0:	c3                   	ret    

000001a1 <gets>:

char*
gets(char *buf, int max)
{
 1a1:	55                   	push   %ebp
 1a2:	89 e5                	mov    %esp,%ebp
 1a4:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1a7:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 1ae:	eb 4c                	jmp    1fc <gets+0x5b>
    cc = read(0, &c, 1);
 1b0:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 1b7:	00 
 1b8:	8d 45 ef             	lea    -0x11(%ebp),%eax
 1bb:	89 44 24 04          	mov    %eax,0x4(%esp)
 1bf:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 1c6:	e8 61 02 00 00       	call   42c <read>
 1cb:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 1ce:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 1d2:	7f 02                	jg     1d6 <gets+0x35>
      break;
 1d4:	eb 31                	jmp    207 <gets+0x66>
    buf[i++] = c;
 1d6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1d9:	8d 50 01             	lea    0x1(%eax),%edx
 1dc:	89 55 f4             	mov    %edx,-0xc(%ebp)
 1df:	89 c2                	mov    %eax,%edx
 1e1:	8b 45 08             	mov    0x8(%ebp),%eax
 1e4:	01 c2                	add    %eax,%edx
 1e6:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1ea:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 1ec:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1f0:	3c 0a                	cmp    $0xa,%al
 1f2:	74 13                	je     207 <gets+0x66>
 1f4:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1f8:	3c 0d                	cmp    $0xd,%al
 1fa:	74 0b                	je     207 <gets+0x66>
  for(i=0; i+1 < max; ){
 1fc:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1ff:	83 c0 01             	add    $0x1,%eax
 202:	3b 45 0c             	cmp    0xc(%ebp),%eax
 205:	7c a9                	jl     1b0 <gets+0xf>
      break;
  }
  buf[i] = '\0';
 207:	8b 55 f4             	mov    -0xc(%ebp),%edx
 20a:	8b 45 08             	mov    0x8(%ebp),%eax
 20d:	01 d0                	add    %edx,%eax
 20f:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 212:	8b 45 08             	mov    0x8(%ebp),%eax
}
 215:	c9                   	leave  
 216:	c3                   	ret    

00000217 <stat>:

int
stat(const char *n, struct stat *st)
{
 217:	55                   	push   %ebp
 218:	89 e5                	mov    %esp,%ebp
 21a:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 21d:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 224:	00 
 225:	8b 45 08             	mov    0x8(%ebp),%eax
 228:	89 04 24             	mov    %eax,(%esp)
 22b:	e8 24 02 00 00       	call   454 <open>
 230:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 233:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 237:	79 07                	jns    240 <stat+0x29>
    return -1;
 239:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 23e:	eb 23                	jmp    263 <stat+0x4c>
  r = fstat(fd, st);
 240:	8b 45 0c             	mov    0xc(%ebp),%eax
 243:	89 44 24 04          	mov    %eax,0x4(%esp)
 247:	8b 45 f4             	mov    -0xc(%ebp),%eax
 24a:	89 04 24             	mov    %eax,(%esp)
 24d:	e8 1a 02 00 00       	call   46c <fstat>
 252:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 255:	8b 45 f4             	mov    -0xc(%ebp),%eax
 258:	89 04 24             	mov    %eax,(%esp)
 25b:	e8 dc 01 00 00       	call   43c <close>
  return r;
 260:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 263:	c9                   	leave  
 264:	c3                   	ret    

00000265 <atoi>:

int
atoi(const char *s)
{
 265:	55                   	push   %ebp
 266:	89 e5                	mov    %esp,%ebp
 268:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 26b:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 272:	eb 25                	jmp    299 <atoi+0x34>
    n = n*10 + *s++ - '0';
 274:	8b 55 fc             	mov    -0x4(%ebp),%edx
 277:	89 d0                	mov    %edx,%eax
 279:	c1 e0 02             	shl    $0x2,%eax
 27c:	01 d0                	add    %edx,%eax
 27e:	01 c0                	add    %eax,%eax
 280:	89 c1                	mov    %eax,%ecx
 282:	8b 45 08             	mov    0x8(%ebp),%eax
 285:	8d 50 01             	lea    0x1(%eax),%edx
 288:	89 55 08             	mov    %edx,0x8(%ebp)
 28b:	0f b6 00             	movzbl (%eax),%eax
 28e:	0f be c0             	movsbl %al,%eax
 291:	01 c8                	add    %ecx,%eax
 293:	83 e8 30             	sub    $0x30,%eax
 296:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 299:	8b 45 08             	mov    0x8(%ebp),%eax
 29c:	0f b6 00             	movzbl (%eax),%eax
 29f:	3c 2f                	cmp    $0x2f,%al
 2a1:	7e 0a                	jle    2ad <atoi+0x48>
 2a3:	8b 45 08             	mov    0x8(%ebp),%eax
 2a6:	0f b6 00             	movzbl (%eax),%eax
 2a9:	3c 39                	cmp    $0x39,%al
 2ab:	7e c7                	jle    274 <atoi+0xf>
  return n;
 2ad:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 2b0:	c9                   	leave  
 2b1:	c3                   	ret    

000002b2 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 2b2:	55                   	push   %ebp
 2b3:	89 e5                	mov    %esp,%ebp
 2b5:	83 ec 10             	sub    $0x10,%esp
  char *dst;
  const char *src;

  dst = vdst;
 2b8:	8b 45 08             	mov    0x8(%ebp),%eax
 2bb:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 2be:	8b 45 0c             	mov    0xc(%ebp),%eax
 2c1:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 2c4:	eb 17                	jmp    2dd <memmove+0x2b>
    *dst++ = *src++;
 2c6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 2c9:	8d 50 01             	lea    0x1(%eax),%edx
 2cc:	89 55 fc             	mov    %edx,-0x4(%ebp)
 2cf:	8b 55 f8             	mov    -0x8(%ebp),%edx
 2d2:	8d 4a 01             	lea    0x1(%edx),%ecx
 2d5:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 2d8:	0f b6 12             	movzbl (%edx),%edx
 2db:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
 2dd:	8b 45 10             	mov    0x10(%ebp),%eax
 2e0:	8d 50 ff             	lea    -0x1(%eax),%edx
 2e3:	89 55 10             	mov    %edx,0x10(%ebp)
 2e6:	85 c0                	test   %eax,%eax
 2e8:	7f dc                	jg     2c6 <memmove+0x14>
  return vdst;
 2ea:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2ed:	c9                   	leave  
 2ee:	c3                   	ret    

000002ef <ps>:

void
ps(void)
{
 2ef:	55                   	push   %ebp
 2f0:	89 e5                	mov    %esp,%ebp
 2f2:	57                   	push   %edi
 2f3:	56                   	push   %esi
 2f4:	53                   	push   %ebx
 2f5:	81 ec 3c 09 00 00    	sub    $0x93c,%esp
  pstatTable pinfo;

  printf(1, "PID\tTKTS\tTCKS\tSTAT\tNAME\n");
 2fb:	c7 44 24 04 95 09 00 	movl   $0x995,0x4(%esp)
 302:	00 
 303:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 30a:	e8 8d 02 00 00       	call   59c <printf>
  getpinfo(&pinfo);
 30f:	8d 85 e4 f6 ff ff    	lea    -0x91c(%ebp),%eax
 315:	89 04 24             	mov    %eax,(%esp)
 318:	e8 97 01 00 00       	call   4b4 <getpinfo>
  int i;
  for (i = 0; i < NPROC; i++) {
 31d:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 324:	e9 ce 00 00 00       	jmp    3f7 <ps+0x108>
      if (pinfo[i].inuse) {
 329:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 32c:	89 d0                	mov    %edx,%eax
 32e:	c1 e0 03             	shl    $0x3,%eax
 331:	01 d0                	add    %edx,%eax
 333:	c1 e0 02             	shl    $0x2,%eax
 336:	8d 5d e8             	lea    -0x18(%ebp),%ebx
 339:	01 d8                	add    %ebx,%eax
 33b:	2d 04 09 00 00       	sub    $0x904,%eax
 340:	8b 00                	mov    (%eax),%eax
 342:	85 c0                	test   %eax,%eax
 344:	0f 84 a9 00 00 00    	je     3f3 <ps+0x104>
        printf(1, "%d\t%d\t%d\t%c\t%s\n",
          pinfo[i].pid,
          pinfo[i].tickets,
          pinfo[i].ticks,
          pinfo[i].state,
          pinfo[i].name);
 34a:	8d 8d e4 f6 ff ff    	lea    -0x91c(%ebp),%ecx
 350:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 353:	89 d0                	mov    %edx,%eax
 355:	c1 e0 03             	shl    $0x3,%eax
 358:	01 d0                	add    %edx,%eax
 35a:	c1 e0 02             	shl    $0x2,%eax
 35d:	83 c0 10             	add    $0x10,%eax
 360:	8d 3c 01             	lea    (%ecx,%eax,1),%edi
          pinfo[i].state,
 363:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 366:	89 d0                	mov    %edx,%eax
 368:	c1 e0 03             	shl    $0x3,%eax
 36b:	01 d0                	add    %edx,%eax
 36d:	c1 e0 02             	shl    $0x2,%eax
 370:	8d 75 e8             	lea    -0x18(%ebp),%esi
 373:	01 f0                	add    %esi,%eax
 375:	2d e4 08 00 00       	sub    $0x8e4,%eax
 37a:	0f b6 00             	movzbl (%eax),%eax
        printf(1, "%d\t%d\t%d\t%c\t%s\n",
 37d:	0f be f0             	movsbl %al,%esi
 380:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 383:	89 d0                	mov    %edx,%eax
 385:	c1 e0 03             	shl    $0x3,%eax
 388:	01 d0                	add    %edx,%eax
 38a:	c1 e0 02             	shl    $0x2,%eax
 38d:	8d 4d e8             	lea    -0x18(%ebp),%ecx
 390:	01 c8                	add    %ecx,%eax
 392:	2d f8 08 00 00       	sub    $0x8f8,%eax
 397:	8b 18                	mov    (%eax),%ebx
 399:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 39c:	89 d0                	mov    %edx,%eax
 39e:	c1 e0 03             	shl    $0x3,%eax
 3a1:	01 d0                	add    %edx,%eax
 3a3:	c1 e0 02             	shl    $0x2,%eax
 3a6:	8d 4d e8             	lea    -0x18(%ebp),%ecx
 3a9:	01 c8                	add    %ecx,%eax
 3ab:	2d 00 09 00 00       	sub    $0x900,%eax
 3b0:	8b 08                	mov    (%eax),%ecx
 3b2:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 3b5:	89 d0                	mov    %edx,%eax
 3b7:	c1 e0 03             	shl    $0x3,%eax
 3ba:	01 d0                	add    %edx,%eax
 3bc:	c1 e0 02             	shl    $0x2,%eax
 3bf:	8d 55 e8             	lea    -0x18(%ebp),%edx
 3c2:	01 d0                	add    %edx,%eax
 3c4:	2d fc 08 00 00       	sub    $0x8fc,%eax
 3c9:	8b 00                	mov    (%eax),%eax
 3cb:	89 7c 24 18          	mov    %edi,0x18(%esp)
 3cf:	89 74 24 14          	mov    %esi,0x14(%esp)
 3d3:	89 5c 24 10          	mov    %ebx,0x10(%esp)
 3d7:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 3db:	89 44 24 08          	mov    %eax,0x8(%esp)
 3df:	c7 44 24 04 ae 09 00 	movl   $0x9ae,0x4(%esp)
 3e6:	00 
 3e7:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 3ee:	e8 a9 01 00 00       	call   59c <printf>
  for (i = 0; i < NPROC; i++) {
 3f3:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
 3f7:	83 7d e4 3f          	cmpl   $0x3f,-0x1c(%ebp)
 3fb:	0f 8e 28 ff ff ff    	jle    329 <ps+0x3a>
      }
  }

}
 401:	81 c4 3c 09 00 00    	add    $0x93c,%esp
 407:	5b                   	pop    %ebx
 408:	5e                   	pop    %esi
 409:	5f                   	pop    %edi
 40a:	5d                   	pop    %ebp
 40b:	c3                   	ret    

0000040c <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 40c:	b8 01 00 00 00       	mov    $0x1,%eax
 411:	cd 40                	int    $0x40
 413:	c3                   	ret    

00000414 <exit>:
SYSCALL(exit)
 414:	b8 02 00 00 00       	mov    $0x2,%eax
 419:	cd 40                	int    $0x40
 41b:	c3                   	ret    

0000041c <wait>:
SYSCALL(wait)
 41c:	b8 03 00 00 00       	mov    $0x3,%eax
 421:	cd 40                	int    $0x40
 423:	c3                   	ret    

00000424 <pipe>:
SYSCALL(pipe)
 424:	b8 04 00 00 00       	mov    $0x4,%eax
 429:	cd 40                	int    $0x40
 42b:	c3                   	ret    

0000042c <read>:
SYSCALL(read)
 42c:	b8 05 00 00 00       	mov    $0x5,%eax
 431:	cd 40                	int    $0x40
 433:	c3                   	ret    

00000434 <write>:
SYSCALL(write)
 434:	b8 10 00 00 00       	mov    $0x10,%eax
 439:	cd 40                	int    $0x40
 43b:	c3                   	ret    

0000043c <close>:
SYSCALL(close)
 43c:	b8 15 00 00 00       	mov    $0x15,%eax
 441:	cd 40                	int    $0x40
 443:	c3                   	ret    

00000444 <kill>:
SYSCALL(kill)
 444:	b8 06 00 00 00       	mov    $0x6,%eax
 449:	cd 40                	int    $0x40
 44b:	c3                   	ret    

0000044c <exec>:
SYSCALL(exec)
 44c:	b8 07 00 00 00       	mov    $0x7,%eax
 451:	cd 40                	int    $0x40
 453:	c3                   	ret    

00000454 <open>:
SYSCALL(open)
 454:	b8 0f 00 00 00       	mov    $0xf,%eax
 459:	cd 40                	int    $0x40
 45b:	c3                   	ret    

0000045c <mknod>:
SYSCALL(mknod)
 45c:	b8 11 00 00 00       	mov    $0x11,%eax
 461:	cd 40                	int    $0x40
 463:	c3                   	ret    

00000464 <unlink>:
SYSCALL(unlink)
 464:	b8 12 00 00 00       	mov    $0x12,%eax
 469:	cd 40                	int    $0x40
 46b:	c3                   	ret    

0000046c <fstat>:
SYSCALL(fstat)
 46c:	b8 08 00 00 00       	mov    $0x8,%eax
 471:	cd 40                	int    $0x40
 473:	c3                   	ret    

00000474 <link>:
SYSCALL(link)
 474:	b8 13 00 00 00       	mov    $0x13,%eax
 479:	cd 40                	int    $0x40
 47b:	c3                   	ret    

0000047c <mkdir>:
SYSCALL(mkdir)
 47c:	b8 14 00 00 00       	mov    $0x14,%eax
 481:	cd 40                	int    $0x40
 483:	c3                   	ret    

00000484 <chdir>:
SYSCALL(chdir)
 484:	b8 09 00 00 00       	mov    $0x9,%eax
 489:	cd 40                	int    $0x40
 48b:	c3                   	ret    

0000048c <dup>:
SYSCALL(dup)
 48c:	b8 0a 00 00 00       	mov    $0xa,%eax
 491:	cd 40                	int    $0x40
 493:	c3                   	ret    

00000494 <getpid>:
SYSCALL(getpid)
 494:	b8 0b 00 00 00       	mov    $0xb,%eax
 499:	cd 40                	int    $0x40
 49b:	c3                   	ret    

0000049c <sbrk>:
SYSCALL(sbrk)
 49c:	b8 0c 00 00 00       	mov    $0xc,%eax
 4a1:	cd 40                	int    $0x40
 4a3:	c3                   	ret    

000004a4 <sleep>:
SYSCALL(sleep)
 4a4:	b8 0d 00 00 00       	mov    $0xd,%eax
 4a9:	cd 40                	int    $0x40
 4ab:	c3                   	ret    

000004ac <uptime>:
SYSCALL(uptime)
 4ac:	b8 0e 00 00 00       	mov    $0xe,%eax
 4b1:	cd 40                	int    $0x40
 4b3:	c3                   	ret    

000004b4 <getpinfo>:
SYSCALL(getpinfo)
 4b4:	b8 16 00 00 00       	mov    $0x16,%eax
 4b9:	cd 40                	int    $0x40
 4bb:	c3                   	ret    

000004bc <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 4bc:	55                   	push   %ebp
 4bd:	89 e5                	mov    %esp,%ebp
 4bf:	83 ec 18             	sub    $0x18,%esp
 4c2:	8b 45 0c             	mov    0xc(%ebp),%eax
 4c5:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 4c8:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 4cf:	00 
 4d0:	8d 45 f4             	lea    -0xc(%ebp),%eax
 4d3:	89 44 24 04          	mov    %eax,0x4(%esp)
 4d7:	8b 45 08             	mov    0x8(%ebp),%eax
 4da:	89 04 24             	mov    %eax,(%esp)
 4dd:	e8 52 ff ff ff       	call   434 <write>
}
 4e2:	c9                   	leave  
 4e3:	c3                   	ret    

000004e4 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 4e4:	55                   	push   %ebp
 4e5:	89 e5                	mov    %esp,%ebp
 4e7:	56                   	push   %esi
 4e8:	53                   	push   %ebx
 4e9:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 4ec:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 4f3:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 4f7:	74 17                	je     510 <printint+0x2c>
 4f9:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 4fd:	79 11                	jns    510 <printint+0x2c>
    neg = 1;
 4ff:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 506:	8b 45 0c             	mov    0xc(%ebp),%eax
 509:	f7 d8                	neg    %eax
 50b:	89 45 ec             	mov    %eax,-0x14(%ebp)
 50e:	eb 06                	jmp    516 <printint+0x32>
  } else {
    x = xx;
 510:	8b 45 0c             	mov    0xc(%ebp),%eax
 513:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 516:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 51d:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 520:	8d 41 01             	lea    0x1(%ecx),%eax
 523:	89 45 f4             	mov    %eax,-0xc(%ebp)
 526:	8b 5d 10             	mov    0x10(%ebp),%ebx
 529:	8b 45 ec             	mov    -0x14(%ebp),%eax
 52c:	ba 00 00 00 00       	mov    $0x0,%edx
 531:	f7 f3                	div    %ebx
 533:	89 d0                	mov    %edx,%eax
 535:	0f b6 80 3c 0c 00 00 	movzbl 0xc3c(%eax),%eax
 53c:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 540:	8b 75 10             	mov    0x10(%ebp),%esi
 543:	8b 45 ec             	mov    -0x14(%ebp),%eax
 546:	ba 00 00 00 00       	mov    $0x0,%edx
 54b:	f7 f6                	div    %esi
 54d:	89 45 ec             	mov    %eax,-0x14(%ebp)
 550:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 554:	75 c7                	jne    51d <printint+0x39>
  if(neg)
 556:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 55a:	74 10                	je     56c <printint+0x88>
    buf[i++] = '-';
 55c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 55f:	8d 50 01             	lea    0x1(%eax),%edx
 562:	89 55 f4             	mov    %edx,-0xc(%ebp)
 565:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 56a:	eb 1f                	jmp    58b <printint+0xa7>
 56c:	eb 1d                	jmp    58b <printint+0xa7>
    putc(fd, buf[i]);
 56e:	8d 55 dc             	lea    -0x24(%ebp),%edx
 571:	8b 45 f4             	mov    -0xc(%ebp),%eax
 574:	01 d0                	add    %edx,%eax
 576:	0f b6 00             	movzbl (%eax),%eax
 579:	0f be c0             	movsbl %al,%eax
 57c:	89 44 24 04          	mov    %eax,0x4(%esp)
 580:	8b 45 08             	mov    0x8(%ebp),%eax
 583:	89 04 24             	mov    %eax,(%esp)
 586:	e8 31 ff ff ff       	call   4bc <putc>
  while(--i >= 0)
 58b:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 58f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 593:	79 d9                	jns    56e <printint+0x8a>
}
 595:	83 c4 30             	add    $0x30,%esp
 598:	5b                   	pop    %ebx
 599:	5e                   	pop    %esi
 59a:	5d                   	pop    %ebp
 59b:	c3                   	ret    

0000059c <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 59c:	55                   	push   %ebp
 59d:	89 e5                	mov    %esp,%ebp
 59f:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 5a2:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 5a9:	8d 45 0c             	lea    0xc(%ebp),%eax
 5ac:	83 c0 04             	add    $0x4,%eax
 5af:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 5b2:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 5b9:	e9 7c 01 00 00       	jmp    73a <printf+0x19e>
    c = fmt[i] & 0xff;
 5be:	8b 55 0c             	mov    0xc(%ebp),%edx
 5c1:	8b 45 f0             	mov    -0x10(%ebp),%eax
 5c4:	01 d0                	add    %edx,%eax
 5c6:	0f b6 00             	movzbl (%eax),%eax
 5c9:	0f be c0             	movsbl %al,%eax
 5cc:	25 ff 00 00 00       	and    $0xff,%eax
 5d1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 5d4:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 5d8:	75 2c                	jne    606 <printf+0x6a>
      if(c == '%'){
 5da:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 5de:	75 0c                	jne    5ec <printf+0x50>
        state = '%';
 5e0:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 5e7:	e9 4a 01 00 00       	jmp    736 <printf+0x19a>
      } else {
        putc(fd, c);
 5ec:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5ef:	0f be c0             	movsbl %al,%eax
 5f2:	89 44 24 04          	mov    %eax,0x4(%esp)
 5f6:	8b 45 08             	mov    0x8(%ebp),%eax
 5f9:	89 04 24             	mov    %eax,(%esp)
 5fc:	e8 bb fe ff ff       	call   4bc <putc>
 601:	e9 30 01 00 00       	jmp    736 <printf+0x19a>
      }
    } else if(state == '%'){
 606:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 60a:	0f 85 26 01 00 00    	jne    736 <printf+0x19a>
      if(c == 'd'){
 610:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 614:	75 2d                	jne    643 <printf+0xa7>
        printint(fd, *ap, 10, 1);
 616:	8b 45 e8             	mov    -0x18(%ebp),%eax
 619:	8b 00                	mov    (%eax),%eax
 61b:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 622:	00 
 623:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 62a:	00 
 62b:	89 44 24 04          	mov    %eax,0x4(%esp)
 62f:	8b 45 08             	mov    0x8(%ebp),%eax
 632:	89 04 24             	mov    %eax,(%esp)
 635:	e8 aa fe ff ff       	call   4e4 <printint>
        ap++;
 63a:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 63e:	e9 ec 00 00 00       	jmp    72f <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 643:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 647:	74 06                	je     64f <printf+0xb3>
 649:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 64d:	75 2d                	jne    67c <printf+0xe0>
        printint(fd, *ap, 16, 0);
 64f:	8b 45 e8             	mov    -0x18(%ebp),%eax
 652:	8b 00                	mov    (%eax),%eax
 654:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 65b:	00 
 65c:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 663:	00 
 664:	89 44 24 04          	mov    %eax,0x4(%esp)
 668:	8b 45 08             	mov    0x8(%ebp),%eax
 66b:	89 04 24             	mov    %eax,(%esp)
 66e:	e8 71 fe ff ff       	call   4e4 <printint>
        ap++;
 673:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 677:	e9 b3 00 00 00       	jmp    72f <printf+0x193>
      } else if(c == 's'){
 67c:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 680:	75 45                	jne    6c7 <printf+0x12b>
        s = (char*)*ap;
 682:	8b 45 e8             	mov    -0x18(%ebp),%eax
 685:	8b 00                	mov    (%eax),%eax
 687:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 68a:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 68e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 692:	75 09                	jne    69d <printf+0x101>
          s = "(null)";
 694:	c7 45 f4 be 09 00 00 	movl   $0x9be,-0xc(%ebp)
        while(*s != 0){
 69b:	eb 1e                	jmp    6bb <printf+0x11f>
 69d:	eb 1c                	jmp    6bb <printf+0x11f>
          putc(fd, *s);
 69f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6a2:	0f b6 00             	movzbl (%eax),%eax
 6a5:	0f be c0             	movsbl %al,%eax
 6a8:	89 44 24 04          	mov    %eax,0x4(%esp)
 6ac:	8b 45 08             	mov    0x8(%ebp),%eax
 6af:	89 04 24             	mov    %eax,(%esp)
 6b2:	e8 05 fe ff ff       	call   4bc <putc>
          s++;
 6b7:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 6bb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6be:	0f b6 00             	movzbl (%eax),%eax
 6c1:	84 c0                	test   %al,%al
 6c3:	75 da                	jne    69f <printf+0x103>
 6c5:	eb 68                	jmp    72f <printf+0x193>
        }
      } else if(c == 'c'){
 6c7:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 6cb:	75 1d                	jne    6ea <printf+0x14e>
        putc(fd, *ap);
 6cd:	8b 45 e8             	mov    -0x18(%ebp),%eax
 6d0:	8b 00                	mov    (%eax),%eax
 6d2:	0f be c0             	movsbl %al,%eax
 6d5:	89 44 24 04          	mov    %eax,0x4(%esp)
 6d9:	8b 45 08             	mov    0x8(%ebp),%eax
 6dc:	89 04 24             	mov    %eax,(%esp)
 6df:	e8 d8 fd ff ff       	call   4bc <putc>
        ap++;
 6e4:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 6e8:	eb 45                	jmp    72f <printf+0x193>
      } else if(c == '%'){
 6ea:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 6ee:	75 17                	jne    707 <printf+0x16b>
        putc(fd, c);
 6f0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6f3:	0f be c0             	movsbl %al,%eax
 6f6:	89 44 24 04          	mov    %eax,0x4(%esp)
 6fa:	8b 45 08             	mov    0x8(%ebp),%eax
 6fd:	89 04 24             	mov    %eax,(%esp)
 700:	e8 b7 fd ff ff       	call   4bc <putc>
 705:	eb 28                	jmp    72f <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 707:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 70e:	00 
 70f:	8b 45 08             	mov    0x8(%ebp),%eax
 712:	89 04 24             	mov    %eax,(%esp)
 715:	e8 a2 fd ff ff       	call   4bc <putc>
        putc(fd, c);
 71a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 71d:	0f be c0             	movsbl %al,%eax
 720:	89 44 24 04          	mov    %eax,0x4(%esp)
 724:	8b 45 08             	mov    0x8(%ebp),%eax
 727:	89 04 24             	mov    %eax,(%esp)
 72a:	e8 8d fd ff ff       	call   4bc <putc>
      }
      state = 0;
 72f:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 736:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 73a:	8b 55 0c             	mov    0xc(%ebp),%edx
 73d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 740:	01 d0                	add    %edx,%eax
 742:	0f b6 00             	movzbl (%eax),%eax
 745:	84 c0                	test   %al,%al
 747:	0f 85 71 fe ff ff    	jne    5be <printf+0x22>
    }
  }
}
 74d:	c9                   	leave  
 74e:	c3                   	ret    

0000074f <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 74f:	55                   	push   %ebp
 750:	89 e5                	mov    %esp,%ebp
 752:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 755:	8b 45 08             	mov    0x8(%ebp),%eax
 758:	83 e8 08             	sub    $0x8,%eax
 75b:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 75e:	a1 58 0c 00 00       	mov    0xc58,%eax
 763:	89 45 fc             	mov    %eax,-0x4(%ebp)
 766:	eb 24                	jmp    78c <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 768:	8b 45 fc             	mov    -0x4(%ebp),%eax
 76b:	8b 00                	mov    (%eax),%eax
 76d:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 770:	77 12                	ja     784 <free+0x35>
 772:	8b 45 f8             	mov    -0x8(%ebp),%eax
 775:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 778:	77 24                	ja     79e <free+0x4f>
 77a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 77d:	8b 00                	mov    (%eax),%eax
 77f:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 782:	77 1a                	ja     79e <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 784:	8b 45 fc             	mov    -0x4(%ebp),%eax
 787:	8b 00                	mov    (%eax),%eax
 789:	89 45 fc             	mov    %eax,-0x4(%ebp)
 78c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 78f:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 792:	76 d4                	jbe    768 <free+0x19>
 794:	8b 45 fc             	mov    -0x4(%ebp),%eax
 797:	8b 00                	mov    (%eax),%eax
 799:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 79c:	76 ca                	jbe    768 <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 79e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7a1:	8b 40 04             	mov    0x4(%eax),%eax
 7a4:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 7ab:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7ae:	01 c2                	add    %eax,%edx
 7b0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7b3:	8b 00                	mov    (%eax),%eax
 7b5:	39 c2                	cmp    %eax,%edx
 7b7:	75 24                	jne    7dd <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 7b9:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7bc:	8b 50 04             	mov    0x4(%eax),%edx
 7bf:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7c2:	8b 00                	mov    (%eax),%eax
 7c4:	8b 40 04             	mov    0x4(%eax),%eax
 7c7:	01 c2                	add    %eax,%edx
 7c9:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7cc:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 7cf:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7d2:	8b 00                	mov    (%eax),%eax
 7d4:	8b 10                	mov    (%eax),%edx
 7d6:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7d9:	89 10                	mov    %edx,(%eax)
 7db:	eb 0a                	jmp    7e7 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 7dd:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7e0:	8b 10                	mov    (%eax),%edx
 7e2:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7e5:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 7e7:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7ea:	8b 40 04             	mov    0x4(%eax),%eax
 7ed:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 7f4:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7f7:	01 d0                	add    %edx,%eax
 7f9:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 7fc:	75 20                	jne    81e <free+0xcf>
    p->s.size += bp->s.size;
 7fe:	8b 45 fc             	mov    -0x4(%ebp),%eax
 801:	8b 50 04             	mov    0x4(%eax),%edx
 804:	8b 45 f8             	mov    -0x8(%ebp),%eax
 807:	8b 40 04             	mov    0x4(%eax),%eax
 80a:	01 c2                	add    %eax,%edx
 80c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 80f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 812:	8b 45 f8             	mov    -0x8(%ebp),%eax
 815:	8b 10                	mov    (%eax),%edx
 817:	8b 45 fc             	mov    -0x4(%ebp),%eax
 81a:	89 10                	mov    %edx,(%eax)
 81c:	eb 08                	jmp    826 <free+0xd7>
  } else
    p->s.ptr = bp;
 81e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 821:	8b 55 f8             	mov    -0x8(%ebp),%edx
 824:	89 10                	mov    %edx,(%eax)
  freep = p;
 826:	8b 45 fc             	mov    -0x4(%ebp),%eax
 829:	a3 58 0c 00 00       	mov    %eax,0xc58
}
 82e:	c9                   	leave  
 82f:	c3                   	ret    

00000830 <morecore>:

static Header*
morecore(uint nu)
{
 830:	55                   	push   %ebp
 831:	89 e5                	mov    %esp,%ebp
 833:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 836:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 83d:	77 07                	ja     846 <morecore+0x16>
    nu = 4096;
 83f:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 846:	8b 45 08             	mov    0x8(%ebp),%eax
 849:	c1 e0 03             	shl    $0x3,%eax
 84c:	89 04 24             	mov    %eax,(%esp)
 84f:	e8 48 fc ff ff       	call   49c <sbrk>
 854:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 857:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 85b:	75 07                	jne    864 <morecore+0x34>
    return 0;
 85d:	b8 00 00 00 00       	mov    $0x0,%eax
 862:	eb 22                	jmp    886 <morecore+0x56>
  hp = (Header*)p;
 864:	8b 45 f4             	mov    -0xc(%ebp),%eax
 867:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 86a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 86d:	8b 55 08             	mov    0x8(%ebp),%edx
 870:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 873:	8b 45 f0             	mov    -0x10(%ebp),%eax
 876:	83 c0 08             	add    $0x8,%eax
 879:	89 04 24             	mov    %eax,(%esp)
 87c:	e8 ce fe ff ff       	call   74f <free>
  return freep;
 881:	a1 58 0c 00 00       	mov    0xc58,%eax
}
 886:	c9                   	leave  
 887:	c3                   	ret    

00000888 <malloc>:

void*
malloc(uint nbytes)
{
 888:	55                   	push   %ebp
 889:	89 e5                	mov    %esp,%ebp
 88b:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 88e:	8b 45 08             	mov    0x8(%ebp),%eax
 891:	83 c0 07             	add    $0x7,%eax
 894:	c1 e8 03             	shr    $0x3,%eax
 897:	83 c0 01             	add    $0x1,%eax
 89a:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 89d:	a1 58 0c 00 00       	mov    0xc58,%eax
 8a2:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8a5:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 8a9:	75 23                	jne    8ce <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 8ab:	c7 45 f0 50 0c 00 00 	movl   $0xc50,-0x10(%ebp)
 8b2:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8b5:	a3 58 0c 00 00       	mov    %eax,0xc58
 8ba:	a1 58 0c 00 00       	mov    0xc58,%eax
 8bf:	a3 50 0c 00 00       	mov    %eax,0xc50
    base.s.size = 0;
 8c4:	c7 05 54 0c 00 00 00 	movl   $0x0,0xc54
 8cb:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8ce:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8d1:	8b 00                	mov    (%eax),%eax
 8d3:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 8d6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8d9:	8b 40 04             	mov    0x4(%eax),%eax
 8dc:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 8df:	72 4d                	jb     92e <malloc+0xa6>
      if(p->s.size == nunits)
 8e1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8e4:	8b 40 04             	mov    0x4(%eax),%eax
 8e7:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 8ea:	75 0c                	jne    8f8 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 8ec:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8ef:	8b 10                	mov    (%eax),%edx
 8f1:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8f4:	89 10                	mov    %edx,(%eax)
 8f6:	eb 26                	jmp    91e <malloc+0x96>
      else {
        p->s.size -= nunits;
 8f8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8fb:	8b 40 04             	mov    0x4(%eax),%eax
 8fe:	2b 45 ec             	sub    -0x14(%ebp),%eax
 901:	89 c2                	mov    %eax,%edx
 903:	8b 45 f4             	mov    -0xc(%ebp),%eax
 906:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 909:	8b 45 f4             	mov    -0xc(%ebp),%eax
 90c:	8b 40 04             	mov    0x4(%eax),%eax
 90f:	c1 e0 03             	shl    $0x3,%eax
 912:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 915:	8b 45 f4             	mov    -0xc(%ebp),%eax
 918:	8b 55 ec             	mov    -0x14(%ebp),%edx
 91b:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 91e:	8b 45 f0             	mov    -0x10(%ebp),%eax
 921:	a3 58 0c 00 00       	mov    %eax,0xc58
      return (void*)(p + 1);
 926:	8b 45 f4             	mov    -0xc(%ebp),%eax
 929:	83 c0 08             	add    $0x8,%eax
 92c:	eb 38                	jmp    966 <malloc+0xde>
    }
    if(p == freep)
 92e:	a1 58 0c 00 00       	mov    0xc58,%eax
 933:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 936:	75 1b                	jne    953 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 938:	8b 45 ec             	mov    -0x14(%ebp),%eax
 93b:	89 04 24             	mov    %eax,(%esp)
 93e:	e8 ed fe ff ff       	call   830 <morecore>
 943:	89 45 f4             	mov    %eax,-0xc(%ebp)
 946:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 94a:	75 07                	jne    953 <malloc+0xcb>
        return 0;
 94c:	b8 00 00 00 00       	mov    $0x0,%eax
 951:	eb 13                	jmp    966 <malloc+0xde>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 953:	8b 45 f4             	mov    -0xc(%ebp),%eax
 956:	89 45 f0             	mov    %eax,-0x10(%ebp)
 959:	8b 45 f4             	mov    -0xc(%ebp),%eax
 95c:	8b 00                	mov    (%eax),%eax
 95e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }
 961:	e9 70 ff ff ff       	jmp    8d6 <malloc+0x4e>
}
 966:	c9                   	leave  
 967:	c3                   	ret    
