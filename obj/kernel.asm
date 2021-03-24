
bin/kernel:     file format elf32-i386


Disassembly of section .text:

00100000 <kern_init>:
int kern_init(void) __attribute__((noreturn));
void grade_backtrace(void);
static void lab1_switch_test(void);

int
kern_init(void) {
  100000:	f3 0f 1e fb          	endbr32 
  100004:	55                   	push   %ebp
  100005:	89 e5                	mov    %esp,%ebp
  100007:	83 ec 28             	sub    $0x28,%esp
    extern char edata[], end[];
    memset(edata, 0, end - edata);
  10000a:	b8 20 0d 11 00       	mov    $0x110d20,%eax
  10000f:	2d 16 fa 10 00       	sub    $0x10fa16,%eax
  100014:	89 44 24 08          	mov    %eax,0x8(%esp)
  100018:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  10001f:	00 
  100020:	c7 04 24 16 fa 10 00 	movl   $0x10fa16,(%esp)
  100027:	e8 8e 2d 00 00       	call   102dba <memset>

    cons_init();                // init the console
  10002c:	e8 19 16 00 00       	call   10164a <cons_init>

    const char *message = "(THU.CST) os is loading ...";
  100031:	c7 45 f4 e0 35 10 00 	movl   $0x1035e0,-0xc(%ebp)
    cprintf("%s\n\n", message);
  100038:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10003b:	89 44 24 04          	mov    %eax,0x4(%esp)
  10003f:	c7 04 24 fc 35 10 00 	movl   $0x1035fc,(%esp)
  100046:	e8 39 02 00 00       	call   100284 <cprintf>

    print_kerninfo();
  10004b:	e8 f7 08 00 00       	call   100947 <print_kerninfo>

    grade_backtrace();
  100050:	e8 95 00 00 00       	call   1000ea <grade_backtrace>

    pmm_init();                 // init physical memory management
  100055:	e8 0f 2a 00 00       	call   102a69 <pmm_init>

    pic_init();                 // init interrupt controller
  10005a:	e8 40 17 00 00       	call   10179f <pic_init>
    idt_init();                 // init interrupt descriptor table
  10005f:	e8 c0 18 00 00       	call   101924 <idt_init>

    clock_init();               // init clock interrupt
  100064:	e8 66 0d 00 00       	call   100dcf <clock_init>
    intr_enable();              // enable irq interrupt
  100069:	e8 7d 18 00 00       	call   1018eb <intr_enable>
    //LAB1: CAHLLENGE 1 If you try to do it, uncomment lab1_switch_test()
    // user/kernel mode switch test
    //lab1_switch_test();

    /* do nothing */
    while (1);
  10006e:	eb fe                	jmp    10006e <kern_init+0x6e>

00100070 <grade_backtrace2>:
}

void __attribute__((noinline))
grade_backtrace2(int arg0, int arg1, int arg2, int arg3) {
  100070:	f3 0f 1e fb          	endbr32 
  100074:	55                   	push   %ebp
  100075:	89 e5                	mov    %esp,%ebp
  100077:	83 ec 18             	sub    $0x18,%esp
    mon_backtrace(0, NULL, NULL);
  10007a:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  100081:	00 
  100082:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  100089:	00 
  10008a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  100091:	e8 23 0d 00 00       	call   100db9 <mon_backtrace>
}
  100096:	90                   	nop
  100097:	c9                   	leave  
  100098:	c3                   	ret    

00100099 <grade_backtrace1>:

void __attribute__((noinline))
grade_backtrace1(int arg0, int arg1) {
  100099:	f3 0f 1e fb          	endbr32 
  10009d:	55                   	push   %ebp
  10009e:	89 e5                	mov    %esp,%ebp
  1000a0:	53                   	push   %ebx
  1000a1:	83 ec 14             	sub    $0x14,%esp
    grade_backtrace2(arg0, (int)&arg0, arg1, (int)&arg1);
  1000a4:	8d 4d 0c             	lea    0xc(%ebp),%ecx
  1000a7:	8b 55 0c             	mov    0xc(%ebp),%edx
  1000aa:	8d 5d 08             	lea    0x8(%ebp),%ebx
  1000ad:	8b 45 08             	mov    0x8(%ebp),%eax
  1000b0:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
  1000b4:	89 54 24 08          	mov    %edx,0x8(%esp)
  1000b8:	89 5c 24 04          	mov    %ebx,0x4(%esp)
  1000bc:	89 04 24             	mov    %eax,(%esp)
  1000bf:	e8 ac ff ff ff       	call   100070 <grade_backtrace2>
}
  1000c4:	90                   	nop
  1000c5:	83 c4 14             	add    $0x14,%esp
  1000c8:	5b                   	pop    %ebx
  1000c9:	5d                   	pop    %ebp
  1000ca:	c3                   	ret    

001000cb <grade_backtrace0>:

void __attribute__((noinline))
grade_backtrace0(int arg0, int arg1, int arg2) {
  1000cb:	f3 0f 1e fb          	endbr32 
  1000cf:	55                   	push   %ebp
  1000d0:	89 e5                	mov    %esp,%ebp
  1000d2:	83 ec 18             	sub    $0x18,%esp
    grade_backtrace1(arg0, arg2);
  1000d5:	8b 45 10             	mov    0x10(%ebp),%eax
  1000d8:	89 44 24 04          	mov    %eax,0x4(%esp)
  1000dc:	8b 45 08             	mov    0x8(%ebp),%eax
  1000df:	89 04 24             	mov    %eax,(%esp)
  1000e2:	e8 b2 ff ff ff       	call   100099 <grade_backtrace1>
}
  1000e7:	90                   	nop
  1000e8:	c9                   	leave  
  1000e9:	c3                   	ret    

001000ea <grade_backtrace>:

void
grade_backtrace(void) {
  1000ea:	f3 0f 1e fb          	endbr32 
  1000ee:	55                   	push   %ebp
  1000ef:	89 e5                	mov    %esp,%ebp
  1000f1:	83 ec 18             	sub    $0x18,%esp
    grade_backtrace0(0, (int)kern_init, 0xffff0000);
  1000f4:	b8 00 00 10 00       	mov    $0x100000,%eax
  1000f9:	c7 44 24 08 00 00 ff 	movl   $0xffff0000,0x8(%esp)
  100100:	ff 
  100101:	89 44 24 04          	mov    %eax,0x4(%esp)
  100105:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  10010c:	e8 ba ff ff ff       	call   1000cb <grade_backtrace0>
}
  100111:	90                   	nop
  100112:	c9                   	leave  
  100113:	c3                   	ret    

00100114 <lab1_print_cur_status>:

static void
lab1_print_cur_status(void) {
  100114:	f3 0f 1e fb          	endbr32 
  100118:	55                   	push   %ebp
  100119:	89 e5                	mov    %esp,%ebp
  10011b:	83 ec 28             	sub    $0x28,%esp
    static int round = 0;
    uint16_t reg1, reg2, reg3, reg4;
    asm volatile (
  10011e:	8c 4d f6             	mov    %cs,-0xa(%ebp)
  100121:	8c 5d f4             	mov    %ds,-0xc(%ebp)
  100124:	8c 45 f2             	mov    %es,-0xe(%ebp)
  100127:	8c 55 f0             	mov    %ss,-0x10(%ebp)
            "mov %%cs, %0;"
            "mov %%ds, %1;"
            "mov %%es, %2;"
            "mov %%ss, %3;"
            : "=m"(reg1), "=m"(reg2), "=m"(reg3), "=m"(reg4));
    cprintf("%d: @ring %d\n", round, reg1 & 3);
  10012a:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  10012e:	83 e0 03             	and    $0x3,%eax
  100131:	89 c2                	mov    %eax,%edx
  100133:	a1 20 fa 10 00       	mov    0x10fa20,%eax
  100138:	89 54 24 08          	mov    %edx,0x8(%esp)
  10013c:	89 44 24 04          	mov    %eax,0x4(%esp)
  100140:	c7 04 24 01 36 10 00 	movl   $0x103601,(%esp)
  100147:	e8 38 01 00 00       	call   100284 <cprintf>
    cprintf("%d:  cs = %x\n", round, reg1);
  10014c:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  100150:	89 c2                	mov    %eax,%edx
  100152:	a1 20 fa 10 00       	mov    0x10fa20,%eax
  100157:	89 54 24 08          	mov    %edx,0x8(%esp)
  10015b:	89 44 24 04          	mov    %eax,0x4(%esp)
  10015f:	c7 04 24 0f 36 10 00 	movl   $0x10360f,(%esp)
  100166:	e8 19 01 00 00       	call   100284 <cprintf>
    cprintf("%d:  ds = %x\n", round, reg2);
  10016b:	0f b7 45 f4          	movzwl -0xc(%ebp),%eax
  10016f:	89 c2                	mov    %eax,%edx
  100171:	a1 20 fa 10 00       	mov    0x10fa20,%eax
  100176:	89 54 24 08          	mov    %edx,0x8(%esp)
  10017a:	89 44 24 04          	mov    %eax,0x4(%esp)
  10017e:	c7 04 24 1d 36 10 00 	movl   $0x10361d,(%esp)
  100185:	e8 fa 00 00 00       	call   100284 <cprintf>
    cprintf("%d:  es = %x\n", round, reg3);
  10018a:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  10018e:	89 c2                	mov    %eax,%edx
  100190:	a1 20 fa 10 00       	mov    0x10fa20,%eax
  100195:	89 54 24 08          	mov    %edx,0x8(%esp)
  100199:	89 44 24 04          	mov    %eax,0x4(%esp)
  10019d:	c7 04 24 2b 36 10 00 	movl   $0x10362b,(%esp)
  1001a4:	e8 db 00 00 00       	call   100284 <cprintf>
    cprintf("%d:  ss = %x\n", round, reg4);
  1001a9:	0f b7 45 f0          	movzwl -0x10(%ebp),%eax
  1001ad:	89 c2                	mov    %eax,%edx
  1001af:	a1 20 fa 10 00       	mov    0x10fa20,%eax
  1001b4:	89 54 24 08          	mov    %edx,0x8(%esp)
  1001b8:	89 44 24 04          	mov    %eax,0x4(%esp)
  1001bc:	c7 04 24 39 36 10 00 	movl   $0x103639,(%esp)
  1001c3:	e8 bc 00 00 00       	call   100284 <cprintf>
    round ++;
  1001c8:	a1 20 fa 10 00       	mov    0x10fa20,%eax
  1001cd:	40                   	inc    %eax
  1001ce:	a3 20 fa 10 00       	mov    %eax,0x10fa20
}
  1001d3:	90                   	nop
  1001d4:	c9                   	leave  
  1001d5:	c3                   	ret    

001001d6 <lab1_switch_to_user>:

static void
lab1_switch_to_user(void) {
  1001d6:	f3 0f 1e fb          	endbr32 
  1001da:	55                   	push   %ebp
  1001db:	89 e5                	mov    %esp,%ebp
    //LAB1 CHALLENGE 1 : TODO
}
  1001dd:	90                   	nop
  1001de:	5d                   	pop    %ebp
  1001df:	c3                   	ret    

001001e0 <lab1_switch_to_kernel>:

static void
lab1_switch_to_kernel(void) {
  1001e0:	f3 0f 1e fb          	endbr32 
  1001e4:	55                   	push   %ebp
  1001e5:	89 e5                	mov    %esp,%ebp
    //LAB1 CHALLENGE 1 :  TODO
}
  1001e7:	90                   	nop
  1001e8:	5d                   	pop    %ebp
  1001e9:	c3                   	ret    

001001ea <lab1_switch_test>:

static void
lab1_switch_test(void) {
  1001ea:	f3 0f 1e fb          	endbr32 
  1001ee:	55                   	push   %ebp
  1001ef:	89 e5                	mov    %esp,%ebp
  1001f1:	83 ec 18             	sub    $0x18,%esp
    lab1_print_cur_status();
  1001f4:	e8 1b ff ff ff       	call   100114 <lab1_print_cur_status>
    cprintf("+++ switch to  user  mode +++\n");
  1001f9:	c7 04 24 48 36 10 00 	movl   $0x103648,(%esp)
  100200:	e8 7f 00 00 00       	call   100284 <cprintf>
    lab1_switch_to_user();
  100205:	e8 cc ff ff ff       	call   1001d6 <lab1_switch_to_user>
    lab1_print_cur_status();
  10020a:	e8 05 ff ff ff       	call   100114 <lab1_print_cur_status>
    cprintf("+++ switch to kernel mode +++\n");
  10020f:	c7 04 24 68 36 10 00 	movl   $0x103668,(%esp)
  100216:	e8 69 00 00 00       	call   100284 <cprintf>
    lab1_switch_to_kernel();
  10021b:	e8 c0 ff ff ff       	call   1001e0 <lab1_switch_to_kernel>
    lab1_print_cur_status();
  100220:	e8 ef fe ff ff       	call   100114 <lab1_print_cur_status>
}
  100225:	90                   	nop
  100226:	c9                   	leave  
  100227:	c3                   	ret    

00100228 <cputch>:
/* *
 * cputch - writes a single character @c to stdout, and it will
 * increace the value of counter pointed by @cnt.
 * */
static void
cputch(int c, int *cnt) {
  100228:	f3 0f 1e fb          	endbr32 
  10022c:	55                   	push   %ebp
  10022d:	89 e5                	mov    %esp,%ebp
  10022f:	83 ec 18             	sub    $0x18,%esp
    cons_putc(c);
  100232:	8b 45 08             	mov    0x8(%ebp),%eax
  100235:	89 04 24             	mov    %eax,(%esp)
  100238:	e8 3e 14 00 00       	call   10167b <cons_putc>
    (*cnt) ++;
  10023d:	8b 45 0c             	mov    0xc(%ebp),%eax
  100240:	8b 00                	mov    (%eax),%eax
  100242:	8d 50 01             	lea    0x1(%eax),%edx
  100245:	8b 45 0c             	mov    0xc(%ebp),%eax
  100248:	89 10                	mov    %edx,(%eax)
}
  10024a:	90                   	nop
  10024b:	c9                   	leave  
  10024c:	c3                   	ret    

0010024d <vcprintf>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want cprintf() instead.
 * */
int
vcprintf(const char *fmt, va_list ap) {
  10024d:	f3 0f 1e fb          	endbr32 
  100251:	55                   	push   %ebp
  100252:	89 e5                	mov    %esp,%ebp
  100254:	83 ec 28             	sub    $0x28,%esp
    int cnt = 0;
  100257:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    vprintfmt((void*)cputch, &cnt, fmt, ap);
  10025e:	8b 45 0c             	mov    0xc(%ebp),%eax
  100261:	89 44 24 0c          	mov    %eax,0xc(%esp)
  100265:	8b 45 08             	mov    0x8(%ebp),%eax
  100268:	89 44 24 08          	mov    %eax,0x8(%esp)
  10026c:	8d 45 f4             	lea    -0xc(%ebp),%eax
  10026f:	89 44 24 04          	mov    %eax,0x4(%esp)
  100273:	c7 04 24 28 02 10 00 	movl   $0x100228,(%esp)
  10027a:	e8 a7 2e 00 00       	call   103126 <vprintfmt>
    return cnt;
  10027f:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100282:	c9                   	leave  
  100283:	c3                   	ret    

00100284 <cprintf>:
 *
 * The return value is the number of characters which would be
 * written to stdout.
 * */
int
cprintf(const char *fmt, ...) {
  100284:	f3 0f 1e fb          	endbr32 
  100288:	55                   	push   %ebp
  100289:	89 e5                	mov    %esp,%ebp
  10028b:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    int cnt;
    va_start(ap, fmt);
  10028e:	8d 45 0c             	lea    0xc(%ebp),%eax
  100291:	89 45 f0             	mov    %eax,-0x10(%ebp)
    cnt = vcprintf(fmt, ap);
  100294:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100297:	89 44 24 04          	mov    %eax,0x4(%esp)
  10029b:	8b 45 08             	mov    0x8(%ebp),%eax
  10029e:	89 04 24             	mov    %eax,(%esp)
  1002a1:	e8 a7 ff ff ff       	call   10024d <vcprintf>
  1002a6:	89 45 f4             	mov    %eax,-0xc(%ebp)
    va_end(ap);
    return cnt;
  1002a9:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  1002ac:	c9                   	leave  
  1002ad:	c3                   	ret    

001002ae <cputchar>:

/* cputchar - writes a single character to stdout */
void
cputchar(int c) {
  1002ae:	f3 0f 1e fb          	endbr32 
  1002b2:	55                   	push   %ebp
  1002b3:	89 e5                	mov    %esp,%ebp
  1002b5:	83 ec 18             	sub    $0x18,%esp
    cons_putc(c);
  1002b8:	8b 45 08             	mov    0x8(%ebp),%eax
  1002bb:	89 04 24             	mov    %eax,(%esp)
  1002be:	e8 b8 13 00 00       	call   10167b <cons_putc>
}
  1002c3:	90                   	nop
  1002c4:	c9                   	leave  
  1002c5:	c3                   	ret    

001002c6 <cputs>:
/* *
 * cputs- writes the string pointed by @str to stdout and
 * appends a newline character.
 * */
int
cputs(const char *str) {
  1002c6:	f3 0f 1e fb          	endbr32 
  1002ca:	55                   	push   %ebp
  1002cb:	89 e5                	mov    %esp,%ebp
  1002cd:	83 ec 28             	sub    $0x28,%esp
    int cnt = 0;
  1002d0:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    char c;
    while ((c = *str ++) != '\0') {
  1002d7:	eb 13                	jmp    1002ec <cputs+0x26>
        cputch(c, &cnt);
  1002d9:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  1002dd:	8d 55 f0             	lea    -0x10(%ebp),%edx
  1002e0:	89 54 24 04          	mov    %edx,0x4(%esp)
  1002e4:	89 04 24             	mov    %eax,(%esp)
  1002e7:	e8 3c ff ff ff       	call   100228 <cputch>
    while ((c = *str ++) != '\0') {
  1002ec:	8b 45 08             	mov    0x8(%ebp),%eax
  1002ef:	8d 50 01             	lea    0x1(%eax),%edx
  1002f2:	89 55 08             	mov    %edx,0x8(%ebp)
  1002f5:	0f b6 00             	movzbl (%eax),%eax
  1002f8:	88 45 f7             	mov    %al,-0x9(%ebp)
  1002fb:	80 7d f7 00          	cmpb   $0x0,-0x9(%ebp)
  1002ff:	75 d8                	jne    1002d9 <cputs+0x13>
    }
    cputch('\n', &cnt);
  100301:	8d 45 f0             	lea    -0x10(%ebp),%eax
  100304:	89 44 24 04          	mov    %eax,0x4(%esp)
  100308:	c7 04 24 0a 00 00 00 	movl   $0xa,(%esp)
  10030f:	e8 14 ff ff ff       	call   100228 <cputch>
    return cnt;
  100314:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
  100317:	c9                   	leave  
  100318:	c3                   	ret    

00100319 <getchar>:

/* getchar - reads a single non-zero character from stdin */
int
getchar(void) {
  100319:	f3 0f 1e fb          	endbr32 
  10031d:	55                   	push   %ebp
  10031e:	89 e5                	mov    %esp,%ebp
  100320:	83 ec 18             	sub    $0x18,%esp
    int c;
    while ((c = cons_getc()) == 0)
  100323:	90                   	nop
  100324:	e8 80 13 00 00       	call   1016a9 <cons_getc>
  100329:	89 45 f4             	mov    %eax,-0xc(%ebp)
  10032c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100330:	74 f2                	je     100324 <getchar+0xb>
        /* do nothing */;
    return c;
  100332:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100335:	c9                   	leave  
  100336:	c3                   	ret    

00100337 <readline>:
 * The readline() function returns the text of the line read. If some errors
 * are happened, NULL is returned. The return value is a global variable,
 * thus it should be copied before it is used.
 * */
char *
readline(const char *prompt) {
  100337:	f3 0f 1e fb          	endbr32 
  10033b:	55                   	push   %ebp
  10033c:	89 e5                	mov    %esp,%ebp
  10033e:	83 ec 28             	sub    $0x28,%esp
    if (prompt != NULL) {
  100341:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  100345:	74 13                	je     10035a <readline+0x23>
        cprintf("%s", prompt);
  100347:	8b 45 08             	mov    0x8(%ebp),%eax
  10034a:	89 44 24 04          	mov    %eax,0x4(%esp)
  10034e:	c7 04 24 87 36 10 00 	movl   $0x103687,(%esp)
  100355:	e8 2a ff ff ff       	call   100284 <cprintf>
    }
    int i = 0, c;
  10035a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while (1) {
        c = getchar();
  100361:	e8 b3 ff ff ff       	call   100319 <getchar>
  100366:	89 45 f0             	mov    %eax,-0x10(%ebp)
        if (c < 0) {
  100369:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  10036d:	79 07                	jns    100376 <readline+0x3f>
            return NULL;
  10036f:	b8 00 00 00 00       	mov    $0x0,%eax
  100374:	eb 78                	jmp    1003ee <readline+0xb7>
        }
        else if (c >= ' ' && i < BUFSIZE - 1) {
  100376:	83 7d f0 1f          	cmpl   $0x1f,-0x10(%ebp)
  10037a:	7e 28                	jle    1003a4 <readline+0x6d>
  10037c:	81 7d f4 fe 03 00 00 	cmpl   $0x3fe,-0xc(%ebp)
  100383:	7f 1f                	jg     1003a4 <readline+0x6d>
            cputchar(c);
  100385:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100388:	89 04 24             	mov    %eax,(%esp)
  10038b:	e8 1e ff ff ff       	call   1002ae <cputchar>
            buf[i ++] = c;
  100390:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100393:	8d 50 01             	lea    0x1(%eax),%edx
  100396:	89 55 f4             	mov    %edx,-0xc(%ebp)
  100399:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10039c:	88 90 40 fa 10 00    	mov    %dl,0x10fa40(%eax)
  1003a2:	eb 45                	jmp    1003e9 <readline+0xb2>
        }
        else if (c == '\b' && i > 0) {
  1003a4:	83 7d f0 08          	cmpl   $0x8,-0x10(%ebp)
  1003a8:	75 16                	jne    1003c0 <readline+0x89>
  1003aa:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1003ae:	7e 10                	jle    1003c0 <readline+0x89>
            cputchar(c);
  1003b0:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1003b3:	89 04 24             	mov    %eax,(%esp)
  1003b6:	e8 f3 fe ff ff       	call   1002ae <cputchar>
            i --;
  1003bb:	ff 4d f4             	decl   -0xc(%ebp)
  1003be:	eb 29                	jmp    1003e9 <readline+0xb2>
        }
        else if (c == '\n' || c == '\r') {
  1003c0:	83 7d f0 0a          	cmpl   $0xa,-0x10(%ebp)
  1003c4:	74 06                	je     1003cc <readline+0x95>
  1003c6:	83 7d f0 0d          	cmpl   $0xd,-0x10(%ebp)
  1003ca:	75 95                	jne    100361 <readline+0x2a>
            cputchar(c);
  1003cc:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1003cf:	89 04 24             	mov    %eax,(%esp)
  1003d2:	e8 d7 fe ff ff       	call   1002ae <cputchar>
            buf[i] = '\0';
  1003d7:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1003da:	05 40 fa 10 00       	add    $0x10fa40,%eax
  1003df:	c6 00 00             	movb   $0x0,(%eax)
            return buf;
  1003e2:	b8 40 fa 10 00       	mov    $0x10fa40,%eax
  1003e7:	eb 05                	jmp    1003ee <readline+0xb7>
        c = getchar();
  1003e9:	e9 73 ff ff ff       	jmp    100361 <readline+0x2a>
        }
    }
}
  1003ee:	c9                   	leave  
  1003ef:	c3                   	ret    

001003f0 <__panic>:
/* *
 * __panic - __panic is called on unresolvable fatal errors. it prints
 * "panic: 'message'", and then enters the kernel monitor.
 * */
void
__panic(const char *file, int line, const char *fmt, ...) {
  1003f0:	f3 0f 1e fb          	endbr32 
  1003f4:	55                   	push   %ebp
  1003f5:	89 e5                	mov    %esp,%ebp
  1003f7:	83 ec 28             	sub    $0x28,%esp
    if (is_panic) {
  1003fa:	a1 40 fe 10 00       	mov    0x10fe40,%eax
  1003ff:	85 c0                	test   %eax,%eax
  100401:	75 5b                	jne    10045e <__panic+0x6e>
        goto panic_dead;
    }
    is_panic = 1;
  100403:	c7 05 40 fe 10 00 01 	movl   $0x1,0x10fe40
  10040a:	00 00 00 

    // print the 'message'
    va_list ap;
    va_start(ap, fmt);
  10040d:	8d 45 14             	lea    0x14(%ebp),%eax
  100410:	89 45 f4             	mov    %eax,-0xc(%ebp)
    cprintf("kernel panic at %s:%d:\n    ", file, line);
  100413:	8b 45 0c             	mov    0xc(%ebp),%eax
  100416:	89 44 24 08          	mov    %eax,0x8(%esp)
  10041a:	8b 45 08             	mov    0x8(%ebp),%eax
  10041d:	89 44 24 04          	mov    %eax,0x4(%esp)
  100421:	c7 04 24 8a 36 10 00 	movl   $0x10368a,(%esp)
  100428:	e8 57 fe ff ff       	call   100284 <cprintf>
    vcprintf(fmt, ap);
  10042d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100430:	89 44 24 04          	mov    %eax,0x4(%esp)
  100434:	8b 45 10             	mov    0x10(%ebp),%eax
  100437:	89 04 24             	mov    %eax,(%esp)
  10043a:	e8 0e fe ff ff       	call   10024d <vcprintf>
    cprintf("\n");
  10043f:	c7 04 24 a6 36 10 00 	movl   $0x1036a6,(%esp)
  100446:	e8 39 fe ff ff       	call   100284 <cprintf>
    
    cprintf("stack trackback:\n");
  10044b:	c7 04 24 a8 36 10 00 	movl   $0x1036a8,(%esp)
  100452:	e8 2d fe ff ff       	call   100284 <cprintf>
    print_stackframe();
  100457:	e8 3d 06 00 00       	call   100a99 <print_stackframe>
  10045c:	eb 01                	jmp    10045f <__panic+0x6f>
        goto panic_dead;
  10045e:	90                   	nop
    
    va_end(ap);

panic_dead:
    intr_disable();
  10045f:	e8 93 14 00 00       	call   1018f7 <intr_disable>
    while (1) {
        kmonitor(NULL);
  100464:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  10046b:	e8 70 08 00 00       	call   100ce0 <kmonitor>
  100470:	eb f2                	jmp    100464 <__panic+0x74>

00100472 <__warn>:
    }
}

/* __warn - like panic, but don't */
void
__warn(const char *file, int line, const char *fmt, ...) {
  100472:	f3 0f 1e fb          	endbr32 
  100476:	55                   	push   %ebp
  100477:	89 e5                	mov    %esp,%ebp
  100479:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    va_start(ap, fmt);
  10047c:	8d 45 14             	lea    0x14(%ebp),%eax
  10047f:	89 45 f4             	mov    %eax,-0xc(%ebp)
    cprintf("kernel warning at %s:%d:\n    ", file, line);
  100482:	8b 45 0c             	mov    0xc(%ebp),%eax
  100485:	89 44 24 08          	mov    %eax,0x8(%esp)
  100489:	8b 45 08             	mov    0x8(%ebp),%eax
  10048c:	89 44 24 04          	mov    %eax,0x4(%esp)
  100490:	c7 04 24 ba 36 10 00 	movl   $0x1036ba,(%esp)
  100497:	e8 e8 fd ff ff       	call   100284 <cprintf>
    vcprintf(fmt, ap);
  10049c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10049f:	89 44 24 04          	mov    %eax,0x4(%esp)
  1004a3:	8b 45 10             	mov    0x10(%ebp),%eax
  1004a6:	89 04 24             	mov    %eax,(%esp)
  1004a9:	e8 9f fd ff ff       	call   10024d <vcprintf>
    cprintf("\n");
  1004ae:	c7 04 24 a6 36 10 00 	movl   $0x1036a6,(%esp)
  1004b5:	e8 ca fd ff ff       	call   100284 <cprintf>
    va_end(ap);
}
  1004ba:	90                   	nop
  1004bb:	c9                   	leave  
  1004bc:	c3                   	ret    

001004bd <is_kernel_panic>:

bool
is_kernel_panic(void) {
  1004bd:	f3 0f 1e fb          	endbr32 
  1004c1:	55                   	push   %ebp
  1004c2:	89 e5                	mov    %esp,%ebp
    return is_panic;
  1004c4:	a1 40 fe 10 00       	mov    0x10fe40,%eax
}
  1004c9:	5d                   	pop    %ebp
  1004ca:	c3                   	ret    

001004cb <stab_binsearch>:
 *      stab_binsearch(stabs, &left, &right, N_SO, 0xf0100184);
 * will exit setting left = 118, right = 554.
 * */
static void
stab_binsearch(const struct stab *stabs, int *region_left, int *region_right,
           int type, uintptr_t addr) {
  1004cb:	f3 0f 1e fb          	endbr32 
  1004cf:	55                   	push   %ebp
  1004d0:	89 e5                	mov    %esp,%ebp
  1004d2:	83 ec 20             	sub    $0x20,%esp
    int l = *region_left, r = *region_right, any_matches = 0;
  1004d5:	8b 45 0c             	mov    0xc(%ebp),%eax
  1004d8:	8b 00                	mov    (%eax),%eax
  1004da:	89 45 fc             	mov    %eax,-0x4(%ebp)
  1004dd:	8b 45 10             	mov    0x10(%ebp),%eax
  1004e0:	8b 00                	mov    (%eax),%eax
  1004e2:	89 45 f8             	mov    %eax,-0x8(%ebp)
  1004e5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)

    while (l <= r) {
  1004ec:	e9 ca 00 00 00       	jmp    1005bb <stab_binsearch+0xf0>
        int true_m = (l + r) / 2, m = true_m;
  1004f1:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1004f4:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1004f7:	01 d0                	add    %edx,%eax
  1004f9:	89 c2                	mov    %eax,%edx
  1004fb:	c1 ea 1f             	shr    $0x1f,%edx
  1004fe:	01 d0                	add    %edx,%eax
  100500:	d1 f8                	sar    %eax
  100502:	89 45 ec             	mov    %eax,-0x14(%ebp)
  100505:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100508:	89 45 f0             	mov    %eax,-0x10(%ebp)

        // search for earliest stab with right type
        while (m >= l && stabs[m].n_type != type) {
  10050b:	eb 03                	jmp    100510 <stab_binsearch+0x45>
            m --;
  10050d:	ff 4d f0             	decl   -0x10(%ebp)
        while (m >= l && stabs[m].n_type != type) {
  100510:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100513:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  100516:	7c 1f                	jl     100537 <stab_binsearch+0x6c>
  100518:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10051b:	89 d0                	mov    %edx,%eax
  10051d:	01 c0                	add    %eax,%eax
  10051f:	01 d0                	add    %edx,%eax
  100521:	c1 e0 02             	shl    $0x2,%eax
  100524:	89 c2                	mov    %eax,%edx
  100526:	8b 45 08             	mov    0x8(%ebp),%eax
  100529:	01 d0                	add    %edx,%eax
  10052b:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  10052f:	0f b6 c0             	movzbl %al,%eax
  100532:	39 45 14             	cmp    %eax,0x14(%ebp)
  100535:	75 d6                	jne    10050d <stab_binsearch+0x42>
        }
        if (m < l) {    // no match in [l, m]
  100537:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10053a:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  10053d:	7d 09                	jge    100548 <stab_binsearch+0x7d>
            l = true_m + 1;
  10053f:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100542:	40                   	inc    %eax
  100543:	89 45 fc             	mov    %eax,-0x4(%ebp)
            continue;
  100546:	eb 73                	jmp    1005bb <stab_binsearch+0xf0>
        }

        // actual binary search
        any_matches = 1;
  100548:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
        if (stabs[m].n_value < addr) {
  10054f:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100552:	89 d0                	mov    %edx,%eax
  100554:	01 c0                	add    %eax,%eax
  100556:	01 d0                	add    %edx,%eax
  100558:	c1 e0 02             	shl    $0x2,%eax
  10055b:	89 c2                	mov    %eax,%edx
  10055d:	8b 45 08             	mov    0x8(%ebp),%eax
  100560:	01 d0                	add    %edx,%eax
  100562:	8b 40 08             	mov    0x8(%eax),%eax
  100565:	39 45 18             	cmp    %eax,0x18(%ebp)
  100568:	76 11                	jbe    10057b <stab_binsearch+0xb0>
            *region_left = m;
  10056a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10056d:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100570:	89 10                	mov    %edx,(%eax)
            l = true_m + 1;
  100572:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100575:	40                   	inc    %eax
  100576:	89 45 fc             	mov    %eax,-0x4(%ebp)
  100579:	eb 40                	jmp    1005bb <stab_binsearch+0xf0>
        } else if (stabs[m].n_value > addr) {
  10057b:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10057e:	89 d0                	mov    %edx,%eax
  100580:	01 c0                	add    %eax,%eax
  100582:	01 d0                	add    %edx,%eax
  100584:	c1 e0 02             	shl    $0x2,%eax
  100587:	89 c2                	mov    %eax,%edx
  100589:	8b 45 08             	mov    0x8(%ebp),%eax
  10058c:	01 d0                	add    %edx,%eax
  10058e:	8b 40 08             	mov    0x8(%eax),%eax
  100591:	39 45 18             	cmp    %eax,0x18(%ebp)
  100594:	73 14                	jae    1005aa <stab_binsearch+0xdf>
            *region_right = m - 1;
  100596:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100599:	8d 50 ff             	lea    -0x1(%eax),%edx
  10059c:	8b 45 10             	mov    0x10(%ebp),%eax
  10059f:	89 10                	mov    %edx,(%eax)
            r = m - 1;
  1005a1:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1005a4:	48                   	dec    %eax
  1005a5:	89 45 f8             	mov    %eax,-0x8(%ebp)
  1005a8:	eb 11                	jmp    1005bb <stab_binsearch+0xf0>
        } else {
            // exact match for 'addr', but continue loop to find
            // *region_right
            *region_left = m;
  1005aa:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005ad:	8b 55 f0             	mov    -0x10(%ebp),%edx
  1005b0:	89 10                	mov    %edx,(%eax)
            l = m;
  1005b2:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1005b5:	89 45 fc             	mov    %eax,-0x4(%ebp)
            addr ++;
  1005b8:	ff 45 18             	incl   0x18(%ebp)
    while (l <= r) {
  1005bb:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1005be:	3b 45 f8             	cmp    -0x8(%ebp),%eax
  1005c1:	0f 8e 2a ff ff ff    	jle    1004f1 <stab_binsearch+0x26>
        }
    }

    if (!any_matches) {
  1005c7:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1005cb:	75 0f                	jne    1005dc <stab_binsearch+0x111>
        *region_right = *region_left - 1;
  1005cd:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005d0:	8b 00                	mov    (%eax),%eax
  1005d2:	8d 50 ff             	lea    -0x1(%eax),%edx
  1005d5:	8b 45 10             	mov    0x10(%ebp),%eax
  1005d8:	89 10                	mov    %edx,(%eax)
        l = *region_right;
        for (; l > *region_left && stabs[l].n_type != type; l --)
            /* do nothing */;
        *region_left = l;
    }
}
  1005da:	eb 3e                	jmp    10061a <stab_binsearch+0x14f>
        l = *region_right;
  1005dc:	8b 45 10             	mov    0x10(%ebp),%eax
  1005df:	8b 00                	mov    (%eax),%eax
  1005e1:	89 45 fc             	mov    %eax,-0x4(%ebp)
        for (; l > *region_left && stabs[l].n_type != type; l --)
  1005e4:	eb 03                	jmp    1005e9 <stab_binsearch+0x11e>
  1005e6:	ff 4d fc             	decl   -0x4(%ebp)
  1005e9:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005ec:	8b 00                	mov    (%eax),%eax
  1005ee:	39 45 fc             	cmp    %eax,-0x4(%ebp)
  1005f1:	7e 1f                	jle    100612 <stab_binsearch+0x147>
  1005f3:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1005f6:	89 d0                	mov    %edx,%eax
  1005f8:	01 c0                	add    %eax,%eax
  1005fa:	01 d0                	add    %edx,%eax
  1005fc:	c1 e0 02             	shl    $0x2,%eax
  1005ff:	89 c2                	mov    %eax,%edx
  100601:	8b 45 08             	mov    0x8(%ebp),%eax
  100604:	01 d0                	add    %edx,%eax
  100606:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  10060a:	0f b6 c0             	movzbl %al,%eax
  10060d:	39 45 14             	cmp    %eax,0x14(%ebp)
  100610:	75 d4                	jne    1005e6 <stab_binsearch+0x11b>
        *region_left = l;
  100612:	8b 45 0c             	mov    0xc(%ebp),%eax
  100615:	8b 55 fc             	mov    -0x4(%ebp),%edx
  100618:	89 10                	mov    %edx,(%eax)
}
  10061a:	90                   	nop
  10061b:	c9                   	leave  
  10061c:	c3                   	ret    

0010061d <debuginfo_eip>:
 * the specified instruction address, @addr.  Returns 0 if information
 * was found, and negative if not.  But even if it returns negative it
 * has stored some information into '*info'.
 * */
int
debuginfo_eip(uintptr_t addr, struct eipdebuginfo *info) {
  10061d:	f3 0f 1e fb          	endbr32 
  100621:	55                   	push   %ebp
  100622:	89 e5                	mov    %esp,%ebp
  100624:	83 ec 58             	sub    $0x58,%esp
    const struct stab *stabs, *stab_end;
    const char *stabstr, *stabstr_end;

    info->eip_file = "<unknown>";
  100627:	8b 45 0c             	mov    0xc(%ebp),%eax
  10062a:	c7 00 d8 36 10 00    	movl   $0x1036d8,(%eax)
    info->eip_line = 0;
  100630:	8b 45 0c             	mov    0xc(%ebp),%eax
  100633:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    info->eip_fn_name = "<unknown>";
  10063a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10063d:	c7 40 08 d8 36 10 00 	movl   $0x1036d8,0x8(%eax)
    info->eip_fn_namelen = 9;
  100644:	8b 45 0c             	mov    0xc(%ebp),%eax
  100647:	c7 40 0c 09 00 00 00 	movl   $0x9,0xc(%eax)
    info->eip_fn_addr = addr;
  10064e:	8b 45 0c             	mov    0xc(%ebp),%eax
  100651:	8b 55 08             	mov    0x8(%ebp),%edx
  100654:	89 50 10             	mov    %edx,0x10(%eax)
    info->eip_fn_narg = 0;
  100657:	8b 45 0c             	mov    0xc(%ebp),%eax
  10065a:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)

    stabs = __STAB_BEGIN__;
  100661:	c7 45 f4 ec 3e 10 00 	movl   $0x103eec,-0xc(%ebp)
    stab_end = __STAB_END__;
  100668:	c7 45 f0 1c cc 10 00 	movl   $0x10cc1c,-0x10(%ebp)
    stabstr = __STABSTR_BEGIN__;
  10066f:	c7 45 ec 1d cc 10 00 	movl   $0x10cc1d,-0x14(%ebp)
    stabstr_end = __STABSTR_END__;
  100676:	c7 45 e8 1d ed 10 00 	movl   $0x10ed1d,-0x18(%ebp)

    // String table validity checks
    if (stabstr_end <= stabstr || stabstr_end[-1] != 0) {
  10067d:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100680:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  100683:	76 0b                	jbe    100690 <debuginfo_eip+0x73>
  100685:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100688:	48                   	dec    %eax
  100689:	0f b6 00             	movzbl (%eax),%eax
  10068c:	84 c0                	test   %al,%al
  10068e:	74 0a                	je     10069a <debuginfo_eip+0x7d>
        return -1;
  100690:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100695:	e9 ab 02 00 00       	jmp    100945 <debuginfo_eip+0x328>
    // 'eip'.  First, we find the basic source file containing 'eip'.
    // Then, we look in that source file for the function.  Then we look
    // for the line number.

    // Search the entire set of stabs for the source file (type N_SO).
    int lfile = 0, rfile = (stab_end - stabs) - 1;
  10069a:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  1006a1:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1006a4:	2b 45 f4             	sub    -0xc(%ebp),%eax
  1006a7:	c1 f8 02             	sar    $0x2,%eax
  1006aa:	69 c0 ab aa aa aa    	imul   $0xaaaaaaab,%eax,%eax
  1006b0:	48                   	dec    %eax
  1006b1:	89 45 e0             	mov    %eax,-0x20(%ebp)
    stab_binsearch(stabs, &lfile, &rfile, N_SO, addr);
  1006b4:	8b 45 08             	mov    0x8(%ebp),%eax
  1006b7:	89 44 24 10          	mov    %eax,0x10(%esp)
  1006bb:	c7 44 24 0c 64 00 00 	movl   $0x64,0xc(%esp)
  1006c2:	00 
  1006c3:	8d 45 e0             	lea    -0x20(%ebp),%eax
  1006c6:	89 44 24 08          	mov    %eax,0x8(%esp)
  1006ca:	8d 45 e4             	lea    -0x1c(%ebp),%eax
  1006cd:	89 44 24 04          	mov    %eax,0x4(%esp)
  1006d1:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1006d4:	89 04 24             	mov    %eax,(%esp)
  1006d7:	e8 ef fd ff ff       	call   1004cb <stab_binsearch>
    if (lfile == 0)
  1006dc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1006df:	85 c0                	test   %eax,%eax
  1006e1:	75 0a                	jne    1006ed <debuginfo_eip+0xd0>
        return -1;
  1006e3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1006e8:	e9 58 02 00 00       	jmp    100945 <debuginfo_eip+0x328>

    // Search within that file's stabs for the function definition
    // (N_FUN).
    int lfun = lfile, rfun = rfile;
  1006ed:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1006f0:	89 45 dc             	mov    %eax,-0x24(%ebp)
  1006f3:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1006f6:	89 45 d8             	mov    %eax,-0x28(%ebp)
    int lline, rline;
    stab_binsearch(stabs, &lfun, &rfun, N_FUN, addr);
  1006f9:	8b 45 08             	mov    0x8(%ebp),%eax
  1006fc:	89 44 24 10          	mov    %eax,0x10(%esp)
  100700:	c7 44 24 0c 24 00 00 	movl   $0x24,0xc(%esp)
  100707:	00 
  100708:	8d 45 d8             	lea    -0x28(%ebp),%eax
  10070b:	89 44 24 08          	mov    %eax,0x8(%esp)
  10070f:	8d 45 dc             	lea    -0x24(%ebp),%eax
  100712:	89 44 24 04          	mov    %eax,0x4(%esp)
  100716:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100719:	89 04 24             	mov    %eax,(%esp)
  10071c:	e8 aa fd ff ff       	call   1004cb <stab_binsearch>

    if (lfun <= rfun) {
  100721:	8b 55 dc             	mov    -0x24(%ebp),%edx
  100724:	8b 45 d8             	mov    -0x28(%ebp),%eax
  100727:	39 c2                	cmp    %eax,%edx
  100729:	7f 78                	jg     1007a3 <debuginfo_eip+0x186>
        // stabs[lfun] points to the function name
        // in the string table, but check bounds just in case.
        if (stabs[lfun].n_strx < stabstr_end - stabstr) {
  10072b:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10072e:	89 c2                	mov    %eax,%edx
  100730:	89 d0                	mov    %edx,%eax
  100732:	01 c0                	add    %eax,%eax
  100734:	01 d0                	add    %edx,%eax
  100736:	c1 e0 02             	shl    $0x2,%eax
  100739:	89 c2                	mov    %eax,%edx
  10073b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10073e:	01 d0                	add    %edx,%eax
  100740:	8b 10                	mov    (%eax),%edx
  100742:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100745:	2b 45 ec             	sub    -0x14(%ebp),%eax
  100748:	39 c2                	cmp    %eax,%edx
  10074a:	73 22                	jae    10076e <debuginfo_eip+0x151>
            info->eip_fn_name = stabstr + stabs[lfun].n_strx;
  10074c:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10074f:	89 c2                	mov    %eax,%edx
  100751:	89 d0                	mov    %edx,%eax
  100753:	01 c0                	add    %eax,%eax
  100755:	01 d0                	add    %edx,%eax
  100757:	c1 e0 02             	shl    $0x2,%eax
  10075a:	89 c2                	mov    %eax,%edx
  10075c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10075f:	01 d0                	add    %edx,%eax
  100761:	8b 10                	mov    (%eax),%edx
  100763:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100766:	01 c2                	add    %eax,%edx
  100768:	8b 45 0c             	mov    0xc(%ebp),%eax
  10076b:	89 50 08             	mov    %edx,0x8(%eax)
        }
        info->eip_fn_addr = stabs[lfun].n_value;
  10076e:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100771:	89 c2                	mov    %eax,%edx
  100773:	89 d0                	mov    %edx,%eax
  100775:	01 c0                	add    %eax,%eax
  100777:	01 d0                	add    %edx,%eax
  100779:	c1 e0 02             	shl    $0x2,%eax
  10077c:	89 c2                	mov    %eax,%edx
  10077e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100781:	01 d0                	add    %edx,%eax
  100783:	8b 50 08             	mov    0x8(%eax),%edx
  100786:	8b 45 0c             	mov    0xc(%ebp),%eax
  100789:	89 50 10             	mov    %edx,0x10(%eax)
        addr -= info->eip_fn_addr;
  10078c:	8b 45 0c             	mov    0xc(%ebp),%eax
  10078f:	8b 40 10             	mov    0x10(%eax),%eax
  100792:	29 45 08             	sub    %eax,0x8(%ebp)
        // Search within the function definition for the line number.
        lline = lfun;
  100795:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100798:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        rline = rfun;
  10079b:	8b 45 d8             	mov    -0x28(%ebp),%eax
  10079e:	89 45 d0             	mov    %eax,-0x30(%ebp)
  1007a1:	eb 15                	jmp    1007b8 <debuginfo_eip+0x19b>
    } else {
        // Couldn't find function stab!  Maybe we're in an assembly
        // file.  Search the whole file for the line number.
        info->eip_fn_addr = addr;
  1007a3:	8b 45 0c             	mov    0xc(%ebp),%eax
  1007a6:	8b 55 08             	mov    0x8(%ebp),%edx
  1007a9:	89 50 10             	mov    %edx,0x10(%eax)
        lline = lfile;
  1007ac:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1007af:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        rline = rfile;
  1007b2:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1007b5:	89 45 d0             	mov    %eax,-0x30(%ebp)
    }
    info->eip_fn_namelen = strfind(info->eip_fn_name, ':') - info->eip_fn_name;
  1007b8:	8b 45 0c             	mov    0xc(%ebp),%eax
  1007bb:	8b 40 08             	mov    0x8(%eax),%eax
  1007be:	c7 44 24 04 3a 00 00 	movl   $0x3a,0x4(%esp)
  1007c5:	00 
  1007c6:	89 04 24             	mov    %eax,(%esp)
  1007c9:	e8 60 24 00 00       	call   102c2e <strfind>
  1007ce:	8b 55 0c             	mov    0xc(%ebp),%edx
  1007d1:	8b 52 08             	mov    0x8(%edx),%edx
  1007d4:	29 d0                	sub    %edx,%eax
  1007d6:	89 c2                	mov    %eax,%edx
  1007d8:	8b 45 0c             	mov    0xc(%ebp),%eax
  1007db:	89 50 0c             	mov    %edx,0xc(%eax)

    // Search within [lline, rline] for the line number stab.
    // If found, set info->eip_line to the right line number.
    // If not found, return -1.
    stab_binsearch(stabs, &lline, &rline, N_SLINE, addr);
  1007de:	8b 45 08             	mov    0x8(%ebp),%eax
  1007e1:	89 44 24 10          	mov    %eax,0x10(%esp)
  1007e5:	c7 44 24 0c 44 00 00 	movl   $0x44,0xc(%esp)
  1007ec:	00 
  1007ed:	8d 45 d0             	lea    -0x30(%ebp),%eax
  1007f0:	89 44 24 08          	mov    %eax,0x8(%esp)
  1007f4:	8d 45 d4             	lea    -0x2c(%ebp),%eax
  1007f7:	89 44 24 04          	mov    %eax,0x4(%esp)
  1007fb:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1007fe:	89 04 24             	mov    %eax,(%esp)
  100801:	e8 c5 fc ff ff       	call   1004cb <stab_binsearch>
    if (lline <= rline) {
  100806:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  100809:	8b 45 d0             	mov    -0x30(%ebp),%eax
  10080c:	39 c2                	cmp    %eax,%edx
  10080e:	7f 23                	jg     100833 <debuginfo_eip+0x216>
        info->eip_line = stabs[rline].n_desc;
  100810:	8b 45 d0             	mov    -0x30(%ebp),%eax
  100813:	89 c2                	mov    %eax,%edx
  100815:	89 d0                	mov    %edx,%eax
  100817:	01 c0                	add    %eax,%eax
  100819:	01 d0                	add    %edx,%eax
  10081b:	c1 e0 02             	shl    $0x2,%eax
  10081e:	89 c2                	mov    %eax,%edx
  100820:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100823:	01 d0                	add    %edx,%eax
  100825:	0f b7 40 06          	movzwl 0x6(%eax),%eax
  100829:	89 c2                	mov    %eax,%edx
  10082b:	8b 45 0c             	mov    0xc(%ebp),%eax
  10082e:	89 50 04             	mov    %edx,0x4(%eax)

    // Search backwards from the line number for the relevant filename stab.
    // We can't just use the "lfile" stab because inlined functions
    // can interpolate code from a different file!
    // Such included source files use the N_SOL stab type.
    while (lline >= lfile
  100831:	eb 11                	jmp    100844 <debuginfo_eip+0x227>
        return -1;
  100833:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100838:	e9 08 01 00 00       	jmp    100945 <debuginfo_eip+0x328>
           && stabs[lline].n_type != N_SOL
           && (stabs[lline].n_type != N_SO || !stabs[lline].n_value)) {
        lline --;
  10083d:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100840:	48                   	dec    %eax
  100841:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    while (lline >= lfile
  100844:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  100847:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  10084a:	39 c2                	cmp    %eax,%edx
  10084c:	7c 56                	jl     1008a4 <debuginfo_eip+0x287>
           && stabs[lline].n_type != N_SOL
  10084e:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100851:	89 c2                	mov    %eax,%edx
  100853:	89 d0                	mov    %edx,%eax
  100855:	01 c0                	add    %eax,%eax
  100857:	01 d0                	add    %edx,%eax
  100859:	c1 e0 02             	shl    $0x2,%eax
  10085c:	89 c2                	mov    %eax,%edx
  10085e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100861:	01 d0                	add    %edx,%eax
  100863:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  100867:	3c 84                	cmp    $0x84,%al
  100869:	74 39                	je     1008a4 <debuginfo_eip+0x287>
           && (stabs[lline].n_type != N_SO || !stabs[lline].n_value)) {
  10086b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  10086e:	89 c2                	mov    %eax,%edx
  100870:	89 d0                	mov    %edx,%eax
  100872:	01 c0                	add    %eax,%eax
  100874:	01 d0                	add    %edx,%eax
  100876:	c1 e0 02             	shl    $0x2,%eax
  100879:	89 c2                	mov    %eax,%edx
  10087b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10087e:	01 d0                	add    %edx,%eax
  100880:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  100884:	3c 64                	cmp    $0x64,%al
  100886:	75 b5                	jne    10083d <debuginfo_eip+0x220>
  100888:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  10088b:	89 c2                	mov    %eax,%edx
  10088d:	89 d0                	mov    %edx,%eax
  10088f:	01 c0                	add    %eax,%eax
  100891:	01 d0                	add    %edx,%eax
  100893:	c1 e0 02             	shl    $0x2,%eax
  100896:	89 c2                	mov    %eax,%edx
  100898:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10089b:	01 d0                	add    %edx,%eax
  10089d:	8b 40 08             	mov    0x8(%eax),%eax
  1008a0:	85 c0                	test   %eax,%eax
  1008a2:	74 99                	je     10083d <debuginfo_eip+0x220>
    }
    if (lline >= lfile && stabs[lline].n_strx < stabstr_end - stabstr) {
  1008a4:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  1008a7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1008aa:	39 c2                	cmp    %eax,%edx
  1008ac:	7c 42                	jl     1008f0 <debuginfo_eip+0x2d3>
  1008ae:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1008b1:	89 c2                	mov    %eax,%edx
  1008b3:	89 d0                	mov    %edx,%eax
  1008b5:	01 c0                	add    %eax,%eax
  1008b7:	01 d0                	add    %edx,%eax
  1008b9:	c1 e0 02             	shl    $0x2,%eax
  1008bc:	89 c2                	mov    %eax,%edx
  1008be:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1008c1:	01 d0                	add    %edx,%eax
  1008c3:	8b 10                	mov    (%eax),%edx
  1008c5:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1008c8:	2b 45 ec             	sub    -0x14(%ebp),%eax
  1008cb:	39 c2                	cmp    %eax,%edx
  1008cd:	73 21                	jae    1008f0 <debuginfo_eip+0x2d3>
        info->eip_file = stabstr + stabs[lline].n_strx;
  1008cf:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1008d2:	89 c2                	mov    %eax,%edx
  1008d4:	89 d0                	mov    %edx,%eax
  1008d6:	01 c0                	add    %eax,%eax
  1008d8:	01 d0                	add    %edx,%eax
  1008da:	c1 e0 02             	shl    $0x2,%eax
  1008dd:	89 c2                	mov    %eax,%edx
  1008df:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1008e2:	01 d0                	add    %edx,%eax
  1008e4:	8b 10                	mov    (%eax),%edx
  1008e6:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1008e9:	01 c2                	add    %eax,%edx
  1008eb:	8b 45 0c             	mov    0xc(%ebp),%eax
  1008ee:	89 10                	mov    %edx,(%eax)
    }

    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
  1008f0:	8b 55 dc             	mov    -0x24(%ebp),%edx
  1008f3:	8b 45 d8             	mov    -0x28(%ebp),%eax
  1008f6:	39 c2                	cmp    %eax,%edx
  1008f8:	7d 46                	jge    100940 <debuginfo_eip+0x323>
        for (lline = lfun + 1;
  1008fa:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1008fd:	40                   	inc    %eax
  1008fe:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  100901:	eb 16                	jmp    100919 <debuginfo_eip+0x2fc>
             lline < rfun && stabs[lline].n_type == N_PSYM;
             lline ++) {
            info->eip_fn_narg ++;
  100903:	8b 45 0c             	mov    0xc(%ebp),%eax
  100906:	8b 40 14             	mov    0x14(%eax),%eax
  100909:	8d 50 01             	lea    0x1(%eax),%edx
  10090c:	8b 45 0c             	mov    0xc(%ebp),%eax
  10090f:	89 50 14             	mov    %edx,0x14(%eax)
             lline ++) {
  100912:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100915:	40                   	inc    %eax
  100916:	89 45 d4             	mov    %eax,-0x2c(%ebp)
             lline < rfun && stabs[lline].n_type == N_PSYM;
  100919:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  10091c:	8b 45 d8             	mov    -0x28(%ebp),%eax
        for (lline = lfun + 1;
  10091f:	39 c2                	cmp    %eax,%edx
  100921:	7d 1d                	jge    100940 <debuginfo_eip+0x323>
             lline < rfun && stabs[lline].n_type == N_PSYM;
  100923:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100926:	89 c2                	mov    %eax,%edx
  100928:	89 d0                	mov    %edx,%eax
  10092a:	01 c0                	add    %eax,%eax
  10092c:	01 d0                	add    %edx,%eax
  10092e:	c1 e0 02             	shl    $0x2,%eax
  100931:	89 c2                	mov    %eax,%edx
  100933:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100936:	01 d0                	add    %edx,%eax
  100938:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  10093c:	3c a0                	cmp    $0xa0,%al
  10093e:	74 c3                	je     100903 <debuginfo_eip+0x2e6>
        }
    }
    return 0;
  100940:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100945:	c9                   	leave  
  100946:	c3                   	ret    

00100947 <print_kerninfo>:
 * print_kerninfo - print the information about kernel, including the location
 * of kernel entry, the start addresses of data and text segements, the start
 * address of free memory and how many memory that kernel has used.
 * */
void
print_kerninfo(void) {
  100947:	f3 0f 1e fb          	endbr32 
  10094b:	55                   	push   %ebp
  10094c:	89 e5                	mov    %esp,%ebp
  10094e:	83 ec 18             	sub    $0x18,%esp
    extern char etext[], edata[], end[], kern_init[];
    cprintf("Special kernel symbols:\n");
  100951:	c7 04 24 e2 36 10 00 	movl   $0x1036e2,(%esp)
  100958:	e8 27 f9 ff ff       	call   100284 <cprintf>
    cprintf("  entry  0x%08x (phys)\n", kern_init);
  10095d:	c7 44 24 04 00 00 10 	movl   $0x100000,0x4(%esp)
  100964:	00 
  100965:	c7 04 24 fb 36 10 00 	movl   $0x1036fb,(%esp)
  10096c:	e8 13 f9 ff ff       	call   100284 <cprintf>
    cprintf("  etext  0x%08x (phys)\n", etext);
  100971:	c7 44 24 04 de 35 10 	movl   $0x1035de,0x4(%esp)
  100978:	00 
  100979:	c7 04 24 13 37 10 00 	movl   $0x103713,(%esp)
  100980:	e8 ff f8 ff ff       	call   100284 <cprintf>
    cprintf("  edata  0x%08x (phys)\n", edata);
  100985:	c7 44 24 04 16 fa 10 	movl   $0x10fa16,0x4(%esp)
  10098c:	00 
  10098d:	c7 04 24 2b 37 10 00 	movl   $0x10372b,(%esp)
  100994:	e8 eb f8 ff ff       	call   100284 <cprintf>
    cprintf("  end    0x%08x (phys)\n", end);
  100999:	c7 44 24 04 20 0d 11 	movl   $0x110d20,0x4(%esp)
  1009a0:	00 
  1009a1:	c7 04 24 43 37 10 00 	movl   $0x103743,(%esp)
  1009a8:	e8 d7 f8 ff ff       	call   100284 <cprintf>
    cprintf("Kernel executable memory footprint: %dKB\n", (end - kern_init + 1023)/1024);
  1009ad:	b8 20 0d 11 00       	mov    $0x110d20,%eax
  1009b2:	2d 00 00 10 00       	sub    $0x100000,%eax
  1009b7:	05 ff 03 00 00       	add    $0x3ff,%eax
  1009bc:	8d 90 ff 03 00 00    	lea    0x3ff(%eax),%edx
  1009c2:	85 c0                	test   %eax,%eax
  1009c4:	0f 48 c2             	cmovs  %edx,%eax
  1009c7:	c1 f8 0a             	sar    $0xa,%eax
  1009ca:	89 44 24 04          	mov    %eax,0x4(%esp)
  1009ce:	c7 04 24 5c 37 10 00 	movl   $0x10375c,(%esp)
  1009d5:	e8 aa f8 ff ff       	call   100284 <cprintf>
}
  1009da:	90                   	nop
  1009db:	c9                   	leave  
  1009dc:	c3                   	ret    

001009dd <print_debuginfo>:
/* *
 * print_debuginfo - read and print the stat information for the address @eip,
 * and info.eip_fn_addr should be the first address of the related function.
 * */
void
print_debuginfo(uintptr_t eip) {
  1009dd:	f3 0f 1e fb          	endbr32 
  1009e1:	55                   	push   %ebp
  1009e2:	89 e5                	mov    %esp,%ebp
  1009e4:	81 ec 48 01 00 00    	sub    $0x148,%esp
    struct eipdebuginfo info;
    if (debuginfo_eip(eip, &info) != 0) {
  1009ea:	8d 45 dc             	lea    -0x24(%ebp),%eax
  1009ed:	89 44 24 04          	mov    %eax,0x4(%esp)
  1009f1:	8b 45 08             	mov    0x8(%ebp),%eax
  1009f4:	89 04 24             	mov    %eax,(%esp)
  1009f7:	e8 21 fc ff ff       	call   10061d <debuginfo_eip>
  1009fc:	85 c0                	test   %eax,%eax
  1009fe:	74 15                	je     100a15 <print_debuginfo+0x38>
        cprintf("    <unknow>: -- 0x%08x --\n", eip);
  100a00:	8b 45 08             	mov    0x8(%ebp),%eax
  100a03:	89 44 24 04          	mov    %eax,0x4(%esp)
  100a07:	c7 04 24 86 37 10 00 	movl   $0x103786,(%esp)
  100a0e:	e8 71 f8 ff ff       	call   100284 <cprintf>
        }
        fnname[j] = '\0';
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
                fnname, eip - info.eip_fn_addr);
    }
}
  100a13:	eb 6c                	jmp    100a81 <print_debuginfo+0xa4>
        for (j = 0; j < info.eip_fn_namelen; j ++) {
  100a15:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100a1c:	eb 1b                	jmp    100a39 <print_debuginfo+0x5c>
            fnname[j] = info.eip_fn_name[j];
  100a1e:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  100a21:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100a24:	01 d0                	add    %edx,%eax
  100a26:	0f b6 10             	movzbl (%eax),%edx
  100a29:	8d 8d dc fe ff ff    	lea    -0x124(%ebp),%ecx
  100a2f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100a32:	01 c8                	add    %ecx,%eax
  100a34:	88 10                	mov    %dl,(%eax)
        for (j = 0; j < info.eip_fn_namelen; j ++) {
  100a36:	ff 45 f4             	incl   -0xc(%ebp)
  100a39:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100a3c:	39 45 f4             	cmp    %eax,-0xc(%ebp)
  100a3f:	7c dd                	jl     100a1e <print_debuginfo+0x41>
        fnname[j] = '\0';
  100a41:	8d 95 dc fe ff ff    	lea    -0x124(%ebp),%edx
  100a47:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100a4a:	01 d0                	add    %edx,%eax
  100a4c:	c6 00 00             	movb   $0x0,(%eax)
                fnname, eip - info.eip_fn_addr);
  100a4f:	8b 45 ec             	mov    -0x14(%ebp),%eax
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
  100a52:	8b 55 08             	mov    0x8(%ebp),%edx
  100a55:	89 d1                	mov    %edx,%ecx
  100a57:	29 c1                	sub    %eax,%ecx
  100a59:	8b 55 e0             	mov    -0x20(%ebp),%edx
  100a5c:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100a5f:	89 4c 24 10          	mov    %ecx,0x10(%esp)
  100a63:	8d 8d dc fe ff ff    	lea    -0x124(%ebp),%ecx
  100a69:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
  100a6d:	89 54 24 08          	mov    %edx,0x8(%esp)
  100a71:	89 44 24 04          	mov    %eax,0x4(%esp)
  100a75:	c7 04 24 a2 37 10 00 	movl   $0x1037a2,(%esp)
  100a7c:	e8 03 f8 ff ff       	call   100284 <cprintf>
}
  100a81:	90                   	nop
  100a82:	c9                   	leave  
  100a83:	c3                   	ret    

00100a84 <read_eip>:

static __noinline uint32_t
read_eip(void) {
  100a84:	f3 0f 1e fb          	endbr32 
  100a88:	55                   	push   %ebp
  100a89:	89 e5                	mov    %esp,%ebp
  100a8b:	83 ec 10             	sub    $0x10,%esp
    uint32_t eip;
    asm volatile("movl 4(%%ebp), %0" : "=r" (eip));
  100a8e:	8b 45 04             	mov    0x4(%ebp),%eax
  100a91:	89 45 fc             	mov    %eax,-0x4(%ebp)
    return eip;
  100a94:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  100a97:	c9                   	leave  
  100a98:	c3                   	ret    

00100a99 <print_stackframe>:
 *
 * Note that, the length of ebp-chain is limited. In boot/bootasm.S, before jumping
 * to the kernel entry, the value of ebp has been set to zero, that's the boundary.
 * */
void
print_stackframe(void) {
  100a99:	f3 0f 1e fb          	endbr32 
  100a9d:	55                   	push   %ebp
  100a9e:	89 e5                	mov    %esp,%ebp
  100aa0:	83 ec 38             	sub    $0x38,%esp
}

static inline uint32_t
read_ebp(void) {
    uint32_t ebp;
    asm volatile ("movl %%ebp, %0" : "=r" (ebp));
  100aa3:	89 e8                	mov    %ebp,%eax
  100aa5:	89 45 e0             	mov    %eax,-0x20(%ebp)
    return ebp;
  100aa8:	8b 45 e0             	mov    -0x20(%ebp),%eax
      *    (3.5) popup a calling stackframe
      *           NOTICE: the calling funciton's return addr eip  = ss:[ebp+4]
      *                   the calling funciton's ebp = ss:[ebp]
      */

    uint32_t ebp = read_ebp(), eip = read_eip();
  100aab:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100aae:	e8 d1 ff ff ff       	call   100a84 <read_eip>
  100ab3:	89 45 f0             	mov    %eax,-0x10(%ebp)
    for(int i = 0;i < STACKFRAME_DEPTH; i++)
  100ab6:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  100abd:	e9 9a 00 00 00       	jmp    100b5c <print_stackframe+0xc3>
    {
        if(ebp == 0) break;
  100ac2:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100ac6:	0f 84 9c 00 00 00    	je     100b68 <print_stackframe+0xcf>
        cprintf("ebp: 0x%08x  eip:0x%08x  ", ebp, eip);
  100acc:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100acf:	89 44 24 08          	mov    %eax,0x8(%esp)
  100ad3:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100ad6:	89 44 24 04          	mov    %eax,0x4(%esp)
  100ada:	c7 04 24 b4 37 10 00 	movl   $0x1037b4,(%esp)
  100ae1:	e8 9e f7 ff ff       	call   100284 <cprintf>
        uint32_t* args_addr = (uint32_t*)ebp + 2;
  100ae6:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100ae9:	83 c0 08             	add    $0x8,%eax
  100aec:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        for(int j = 0;j <= 4; j++)
  100aef:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
  100af6:	eb 24                	jmp    100b1c <print_stackframe+0x83>
        {
            cprintf("0x%08x  ", args_addr[j]);
  100af8:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100afb:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  100b02:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100b05:	01 d0                	add    %edx,%eax
  100b07:	8b 00                	mov    (%eax),%eax
  100b09:	89 44 24 04          	mov    %eax,0x4(%esp)
  100b0d:	c7 04 24 ce 37 10 00 	movl   $0x1037ce,(%esp)
  100b14:	e8 6b f7 ff ff       	call   100284 <cprintf>
        for(int j = 0;j <= 4; j++)
  100b19:	ff 45 e8             	incl   -0x18(%ebp)
  100b1c:	83 7d e8 04          	cmpl   $0x4,-0x18(%ebp)
  100b20:	7e d6                	jle    100af8 <print_stackframe+0x5f>
        }
        cprintf("\n");
  100b22:	c7 04 24 d7 37 10 00 	movl   $0x1037d7,(%esp)
  100b29:	e8 56 f7 ff ff       	call   100284 <cprintf>
        print_debuginfo(eip - 1);
  100b2e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100b31:	48                   	dec    %eax
  100b32:	89 04 24             	mov    %eax,(%esp)
  100b35:	e8 a3 fe ff ff       	call   1009dd <print_debuginfo>
        eip = ((uint32_t*)ebp)[1];
  100b3a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100b3d:	83 c0 04             	add    $0x4,%eax
  100b40:	8b 00                	mov    (%eax),%eax
  100b42:	89 45 f0             	mov    %eax,-0x10(%ebp)
        ebp = ((uint32_t*)ebp)[0];
  100b45:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100b48:	8b 00                	mov    (%eax),%eax
  100b4a:	89 45 f4             	mov    %eax,-0xc(%ebp)
        cprintf("\n");
  100b4d:	c7 04 24 d7 37 10 00 	movl   $0x1037d7,(%esp)
  100b54:	e8 2b f7 ff ff       	call   100284 <cprintf>
    for(int i = 0;i < STACKFRAME_DEPTH; i++)
  100b59:	ff 45 ec             	incl   -0x14(%ebp)
  100b5c:	83 7d ec 13          	cmpl   $0x13,-0x14(%ebp)
  100b60:	0f 8e 5c ff ff ff    	jle    100ac2 <print_stackframe+0x29>
    }
      
}
  100b66:	eb 01                	jmp    100b69 <print_stackframe+0xd0>
        if(ebp == 0) break;
  100b68:	90                   	nop
}
  100b69:	90                   	nop
  100b6a:	c9                   	leave  
  100b6b:	c3                   	ret    

00100b6c <parse>:
#define MAXARGS         16
#define WHITESPACE      " \t\n\r"

/* parse - parse the command buffer into whitespace-separated arguments */
static int
parse(char *buf, char **argv) {
  100b6c:	f3 0f 1e fb          	endbr32 
  100b70:	55                   	push   %ebp
  100b71:	89 e5                	mov    %esp,%ebp
  100b73:	83 ec 28             	sub    $0x28,%esp
    int argc = 0;
  100b76:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while (1) {
        // find global whitespace
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100b7d:	eb 0c                	jmp    100b8b <parse+0x1f>
            *buf ++ = '\0';
  100b7f:	8b 45 08             	mov    0x8(%ebp),%eax
  100b82:	8d 50 01             	lea    0x1(%eax),%edx
  100b85:	89 55 08             	mov    %edx,0x8(%ebp)
  100b88:	c6 00 00             	movb   $0x0,(%eax)
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100b8b:	8b 45 08             	mov    0x8(%ebp),%eax
  100b8e:	0f b6 00             	movzbl (%eax),%eax
  100b91:	84 c0                	test   %al,%al
  100b93:	74 1d                	je     100bb2 <parse+0x46>
  100b95:	8b 45 08             	mov    0x8(%ebp),%eax
  100b98:	0f b6 00             	movzbl (%eax),%eax
  100b9b:	0f be c0             	movsbl %al,%eax
  100b9e:	89 44 24 04          	mov    %eax,0x4(%esp)
  100ba2:	c7 04 24 5c 38 10 00 	movl   $0x10385c,(%esp)
  100ba9:	e8 4a 20 00 00       	call   102bf8 <strchr>
  100bae:	85 c0                	test   %eax,%eax
  100bb0:	75 cd                	jne    100b7f <parse+0x13>
        }
        if (*buf == '\0') {
  100bb2:	8b 45 08             	mov    0x8(%ebp),%eax
  100bb5:	0f b6 00             	movzbl (%eax),%eax
  100bb8:	84 c0                	test   %al,%al
  100bba:	74 65                	je     100c21 <parse+0xb5>
            break;
        }

        // save and scan past next arg
        if (argc == MAXARGS - 1) {
  100bbc:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
  100bc0:	75 14                	jne    100bd6 <parse+0x6a>
            cprintf("Too many arguments (max %d).\n", MAXARGS);
  100bc2:	c7 44 24 04 10 00 00 	movl   $0x10,0x4(%esp)
  100bc9:	00 
  100bca:	c7 04 24 61 38 10 00 	movl   $0x103861,(%esp)
  100bd1:	e8 ae f6 ff ff       	call   100284 <cprintf>
        }
        argv[argc ++] = buf;
  100bd6:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100bd9:	8d 50 01             	lea    0x1(%eax),%edx
  100bdc:	89 55 f4             	mov    %edx,-0xc(%ebp)
  100bdf:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  100be6:	8b 45 0c             	mov    0xc(%ebp),%eax
  100be9:	01 c2                	add    %eax,%edx
  100beb:	8b 45 08             	mov    0x8(%ebp),%eax
  100bee:	89 02                	mov    %eax,(%edx)
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
  100bf0:	eb 03                	jmp    100bf5 <parse+0x89>
            buf ++;
  100bf2:	ff 45 08             	incl   0x8(%ebp)
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
  100bf5:	8b 45 08             	mov    0x8(%ebp),%eax
  100bf8:	0f b6 00             	movzbl (%eax),%eax
  100bfb:	84 c0                	test   %al,%al
  100bfd:	74 8c                	je     100b8b <parse+0x1f>
  100bff:	8b 45 08             	mov    0x8(%ebp),%eax
  100c02:	0f b6 00             	movzbl (%eax),%eax
  100c05:	0f be c0             	movsbl %al,%eax
  100c08:	89 44 24 04          	mov    %eax,0x4(%esp)
  100c0c:	c7 04 24 5c 38 10 00 	movl   $0x10385c,(%esp)
  100c13:	e8 e0 1f 00 00       	call   102bf8 <strchr>
  100c18:	85 c0                	test   %eax,%eax
  100c1a:	74 d6                	je     100bf2 <parse+0x86>
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100c1c:	e9 6a ff ff ff       	jmp    100b8b <parse+0x1f>
            break;
  100c21:	90                   	nop
        }
    }
    return argc;
  100c22:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100c25:	c9                   	leave  
  100c26:	c3                   	ret    

00100c27 <runcmd>:
/* *
 * runcmd - parse the input string, split it into separated arguments
 * and then lookup and invoke some related commands/
 * */
static int
runcmd(char *buf, struct trapframe *tf) {
  100c27:	f3 0f 1e fb          	endbr32 
  100c2b:	55                   	push   %ebp
  100c2c:	89 e5                	mov    %esp,%ebp
  100c2e:	53                   	push   %ebx
  100c2f:	83 ec 64             	sub    $0x64,%esp
    char *argv[MAXARGS];
    int argc = parse(buf, argv);
  100c32:	8d 45 b0             	lea    -0x50(%ebp),%eax
  100c35:	89 44 24 04          	mov    %eax,0x4(%esp)
  100c39:	8b 45 08             	mov    0x8(%ebp),%eax
  100c3c:	89 04 24             	mov    %eax,(%esp)
  100c3f:	e8 28 ff ff ff       	call   100b6c <parse>
  100c44:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if (argc == 0) {
  100c47:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  100c4b:	75 0a                	jne    100c57 <runcmd+0x30>
        return 0;
  100c4d:	b8 00 00 00 00       	mov    $0x0,%eax
  100c52:	e9 83 00 00 00       	jmp    100cda <runcmd+0xb3>
    }
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100c57:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100c5e:	eb 5a                	jmp    100cba <runcmd+0x93>
        if (strcmp(commands[i].name, argv[0]) == 0) {
  100c60:	8b 4d b0             	mov    -0x50(%ebp),%ecx
  100c63:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100c66:	89 d0                	mov    %edx,%eax
  100c68:	01 c0                	add    %eax,%eax
  100c6a:	01 d0                	add    %edx,%eax
  100c6c:	c1 e0 02             	shl    $0x2,%eax
  100c6f:	05 00 f0 10 00       	add    $0x10f000,%eax
  100c74:	8b 00                	mov    (%eax),%eax
  100c76:	89 4c 24 04          	mov    %ecx,0x4(%esp)
  100c7a:	89 04 24             	mov    %eax,(%esp)
  100c7d:	e8 d2 1e 00 00       	call   102b54 <strcmp>
  100c82:	85 c0                	test   %eax,%eax
  100c84:	75 31                	jne    100cb7 <runcmd+0x90>
            return commands[i].func(argc - 1, argv + 1, tf);
  100c86:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100c89:	89 d0                	mov    %edx,%eax
  100c8b:	01 c0                	add    %eax,%eax
  100c8d:	01 d0                	add    %edx,%eax
  100c8f:	c1 e0 02             	shl    $0x2,%eax
  100c92:	05 08 f0 10 00       	add    $0x10f008,%eax
  100c97:	8b 10                	mov    (%eax),%edx
  100c99:	8d 45 b0             	lea    -0x50(%ebp),%eax
  100c9c:	83 c0 04             	add    $0x4,%eax
  100c9f:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  100ca2:	8d 59 ff             	lea    -0x1(%ecx),%ebx
  100ca5:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  100ca8:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  100cac:	89 44 24 04          	mov    %eax,0x4(%esp)
  100cb0:	89 1c 24             	mov    %ebx,(%esp)
  100cb3:	ff d2                	call   *%edx
  100cb5:	eb 23                	jmp    100cda <runcmd+0xb3>
    for (i = 0; i < NCOMMANDS; i ++) {
  100cb7:	ff 45 f4             	incl   -0xc(%ebp)
  100cba:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100cbd:	83 f8 02             	cmp    $0x2,%eax
  100cc0:	76 9e                	jbe    100c60 <runcmd+0x39>
        }
    }
    cprintf("Unknown command '%s'\n", argv[0]);
  100cc2:	8b 45 b0             	mov    -0x50(%ebp),%eax
  100cc5:	89 44 24 04          	mov    %eax,0x4(%esp)
  100cc9:	c7 04 24 7f 38 10 00 	movl   $0x10387f,(%esp)
  100cd0:	e8 af f5 ff ff       	call   100284 <cprintf>
    return 0;
  100cd5:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100cda:	83 c4 64             	add    $0x64,%esp
  100cdd:	5b                   	pop    %ebx
  100cde:	5d                   	pop    %ebp
  100cdf:	c3                   	ret    

00100ce0 <kmonitor>:

/***** Implementations of basic kernel monitor commands *****/

void
kmonitor(struct trapframe *tf) {
  100ce0:	f3 0f 1e fb          	endbr32 
  100ce4:	55                   	push   %ebp
  100ce5:	89 e5                	mov    %esp,%ebp
  100ce7:	83 ec 28             	sub    $0x28,%esp
    cprintf("Welcome to the kernel debug monitor!!\n");
  100cea:	c7 04 24 98 38 10 00 	movl   $0x103898,(%esp)
  100cf1:	e8 8e f5 ff ff       	call   100284 <cprintf>
    cprintf("Type 'help' for a list of commands.\n");
  100cf6:	c7 04 24 c0 38 10 00 	movl   $0x1038c0,(%esp)
  100cfd:	e8 82 f5 ff ff       	call   100284 <cprintf>

    if (tf != NULL) {
  100d02:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  100d06:	74 0b                	je     100d13 <kmonitor+0x33>
        print_trapframe(tf);
  100d08:	8b 45 08             	mov    0x8(%ebp),%eax
  100d0b:	89 04 24             	mov    %eax,(%esp)
  100d0e:	e8 d5 0d 00 00       	call   101ae8 <print_trapframe>
    }

    char *buf;
    while (1) {
        if ((buf = readline("K> ")) != NULL) {
  100d13:	c7 04 24 e5 38 10 00 	movl   $0x1038e5,(%esp)
  100d1a:	e8 18 f6 ff ff       	call   100337 <readline>
  100d1f:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100d22:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100d26:	74 eb                	je     100d13 <kmonitor+0x33>
            if (runcmd(buf, tf) < 0) {
  100d28:	8b 45 08             	mov    0x8(%ebp),%eax
  100d2b:	89 44 24 04          	mov    %eax,0x4(%esp)
  100d2f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100d32:	89 04 24             	mov    %eax,(%esp)
  100d35:	e8 ed fe ff ff       	call   100c27 <runcmd>
  100d3a:	85 c0                	test   %eax,%eax
  100d3c:	78 02                	js     100d40 <kmonitor+0x60>
        if ((buf = readline("K> ")) != NULL) {
  100d3e:	eb d3                	jmp    100d13 <kmonitor+0x33>
                break;
  100d40:	90                   	nop
            }
        }
    }
}
  100d41:	90                   	nop
  100d42:	c9                   	leave  
  100d43:	c3                   	ret    

00100d44 <mon_help>:

/* mon_help - print the information about mon_* functions */
int
mon_help(int argc, char **argv, struct trapframe *tf) {
  100d44:	f3 0f 1e fb          	endbr32 
  100d48:	55                   	push   %ebp
  100d49:	89 e5                	mov    %esp,%ebp
  100d4b:	83 ec 28             	sub    $0x28,%esp
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100d4e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100d55:	eb 3d                	jmp    100d94 <mon_help+0x50>
        cprintf("%s - %s\n", commands[i].name, commands[i].desc);
  100d57:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100d5a:	89 d0                	mov    %edx,%eax
  100d5c:	01 c0                	add    %eax,%eax
  100d5e:	01 d0                	add    %edx,%eax
  100d60:	c1 e0 02             	shl    $0x2,%eax
  100d63:	05 04 f0 10 00       	add    $0x10f004,%eax
  100d68:	8b 08                	mov    (%eax),%ecx
  100d6a:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100d6d:	89 d0                	mov    %edx,%eax
  100d6f:	01 c0                	add    %eax,%eax
  100d71:	01 d0                	add    %edx,%eax
  100d73:	c1 e0 02             	shl    $0x2,%eax
  100d76:	05 00 f0 10 00       	add    $0x10f000,%eax
  100d7b:	8b 00                	mov    (%eax),%eax
  100d7d:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  100d81:	89 44 24 04          	mov    %eax,0x4(%esp)
  100d85:	c7 04 24 e9 38 10 00 	movl   $0x1038e9,(%esp)
  100d8c:	e8 f3 f4 ff ff       	call   100284 <cprintf>
    for (i = 0; i < NCOMMANDS; i ++) {
  100d91:	ff 45 f4             	incl   -0xc(%ebp)
  100d94:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100d97:	83 f8 02             	cmp    $0x2,%eax
  100d9a:	76 bb                	jbe    100d57 <mon_help+0x13>
    }
    return 0;
  100d9c:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100da1:	c9                   	leave  
  100da2:	c3                   	ret    

00100da3 <mon_kerninfo>:
/* *
 * mon_kerninfo - call print_kerninfo in kern/debug/kdebug.c to
 * print the memory occupancy in kernel.
 * */
int
mon_kerninfo(int argc, char **argv, struct trapframe *tf) {
  100da3:	f3 0f 1e fb          	endbr32 
  100da7:	55                   	push   %ebp
  100da8:	89 e5                	mov    %esp,%ebp
  100daa:	83 ec 08             	sub    $0x8,%esp
    print_kerninfo();
  100dad:	e8 95 fb ff ff       	call   100947 <print_kerninfo>
    return 0;
  100db2:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100db7:	c9                   	leave  
  100db8:	c3                   	ret    

00100db9 <mon_backtrace>:
/* *
 * mon_backtrace - call print_stackframe in kern/debug/kdebug.c to
 * print a backtrace of the stack.
 * */
int
mon_backtrace(int argc, char **argv, struct trapframe *tf) {
  100db9:	f3 0f 1e fb          	endbr32 
  100dbd:	55                   	push   %ebp
  100dbe:	89 e5                	mov    %esp,%ebp
  100dc0:	83 ec 08             	sub    $0x8,%esp
    print_stackframe();
  100dc3:	e8 d1 fc ff ff       	call   100a99 <print_stackframe>
    return 0;
  100dc8:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100dcd:	c9                   	leave  
  100dce:	c3                   	ret    

00100dcf <clock_init>:
/* *
 * clock_init - initialize 8253 clock to interrupt 100 times per second,
 * and then enable IRQ_TIMER.
 * */
void
clock_init(void) {
  100dcf:	f3 0f 1e fb          	endbr32 
  100dd3:	55                   	push   %ebp
  100dd4:	89 e5                	mov    %esp,%ebp
  100dd6:	83 ec 28             	sub    $0x28,%esp
  100dd9:	66 c7 45 ee 43 00    	movw   $0x43,-0x12(%ebp)
  100ddf:	c6 45 ed 34          	movb   $0x34,-0x13(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100de3:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100de7:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  100deb:	ee                   	out    %al,(%dx)
}
  100dec:	90                   	nop
  100ded:	66 c7 45 f2 40 00    	movw   $0x40,-0xe(%ebp)
  100df3:	c6 45 f1 9c          	movb   $0x9c,-0xf(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100df7:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  100dfb:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  100dff:	ee                   	out    %al,(%dx)
}
  100e00:	90                   	nop
  100e01:	66 c7 45 f6 40 00    	movw   $0x40,-0xa(%ebp)
  100e07:	c6 45 f5 2e          	movb   $0x2e,-0xb(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100e0b:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  100e0f:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  100e13:	ee                   	out    %al,(%dx)
}
  100e14:	90                   	nop
    outb(TIMER_MODE, TIMER_SEL0 | TIMER_RATEGEN | TIMER_16BIT);
    outb(IO_TIMER1, TIMER_DIV(100) % 256);
    outb(IO_TIMER1, TIMER_DIV(100) / 256);

    // initialize time counter 'ticks' to zero
    ticks = 0;
  100e15:	c7 05 08 09 11 00 00 	movl   $0x0,0x110908
  100e1c:	00 00 00 

    cprintf("++ setup timer interrupts\n");
  100e1f:	c7 04 24 f2 38 10 00 	movl   $0x1038f2,(%esp)
  100e26:	e8 59 f4 ff ff       	call   100284 <cprintf>
    pic_enable(IRQ_TIMER);
  100e2b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  100e32:	e8 31 09 00 00       	call   101768 <pic_enable>
}
  100e37:	90                   	nop
  100e38:	c9                   	leave  
  100e39:	c3                   	ret    

00100e3a <delay>:
#include <picirq.h>
#include <trap.h>

/* stupid I/O delay routine necessitated by historical PC design flaws */
static void
delay(void) {
  100e3a:	f3 0f 1e fb          	endbr32 
  100e3e:	55                   	push   %ebp
  100e3f:	89 e5                	mov    %esp,%ebp
  100e41:	83 ec 10             	sub    $0x10,%esp
  100e44:	66 c7 45 f2 84 00    	movw   $0x84,-0xe(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100e4a:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  100e4e:	89 c2                	mov    %eax,%edx
  100e50:	ec                   	in     (%dx),%al
  100e51:	88 45 f1             	mov    %al,-0xf(%ebp)
  100e54:	66 c7 45 f6 84 00    	movw   $0x84,-0xa(%ebp)
  100e5a:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  100e5e:	89 c2                	mov    %eax,%edx
  100e60:	ec                   	in     (%dx),%al
  100e61:	88 45 f5             	mov    %al,-0xb(%ebp)
  100e64:	66 c7 45 fa 84 00    	movw   $0x84,-0x6(%ebp)
  100e6a:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  100e6e:	89 c2                	mov    %eax,%edx
  100e70:	ec                   	in     (%dx),%al
  100e71:	88 45 f9             	mov    %al,-0x7(%ebp)
  100e74:	66 c7 45 fe 84 00    	movw   $0x84,-0x2(%ebp)
  100e7a:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  100e7e:	89 c2                	mov    %eax,%edx
  100e80:	ec                   	in     (%dx),%al
  100e81:	88 45 fd             	mov    %al,-0x3(%ebp)
    inb(0x84);
    inb(0x84);
    inb(0x84);
    inb(0x84);
}
  100e84:	90                   	nop
  100e85:	c9                   	leave  
  100e86:	c3                   	ret    

00100e87 <cga_init>:
//    -- 数据寄存器 映射 到 端口 0x3D5或0x3B5 
//    -- 索引寄存器 0x3D4或0x3B4,决定在数据寄存器中的数据表示什么。

/* TEXT-mode CGA/VGA display output */
static void
cga_init(void) {
  100e87:	f3 0f 1e fb          	endbr32 
  100e8b:	55                   	push   %ebp
  100e8c:	89 e5                	mov    %esp,%ebp
  100e8e:	83 ec 20             	sub    $0x20,%esp
    volatile uint16_t *cp = (uint16_t *)CGA_BUF;   //CGA_BUF: 0xB8000 (彩色显示的显存物理基址)
  100e91:	c7 45 fc 00 80 0b 00 	movl   $0xb8000,-0x4(%ebp)
    uint16_t was = *cp;                                            //保存当前显存0xB8000处的值
  100e98:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e9b:	0f b7 00             	movzwl (%eax),%eax
  100e9e:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
    *cp = (uint16_t) 0xA55A;                                   // 给这个地址随便写个值，看看能否再读出同样的值
  100ea2:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100ea5:	66 c7 00 5a a5       	movw   $0xa55a,(%eax)
    if (*cp != 0xA55A) {                                            // 如果读不出来，说明没有这块显存，即是单显配置
  100eaa:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100ead:	0f b7 00             	movzwl (%eax),%eax
  100eb0:	0f b7 c0             	movzwl %ax,%eax
  100eb3:	3d 5a a5 00 00       	cmp    $0xa55a,%eax
  100eb8:	74 12                	je     100ecc <cga_init+0x45>
        cp = (uint16_t*)MONO_BUF;                         //设置为单显的显存基址 MONO_BUF： 0xB0000
  100eba:	c7 45 fc 00 00 0b 00 	movl   $0xb0000,-0x4(%ebp)
        addr_6845 = MONO_BASE;                           //设置为单显控制的IO地址，MONO_BASE: 0x3B4
  100ec1:	66 c7 05 66 fe 10 00 	movw   $0x3b4,0x10fe66
  100ec8:	b4 03 
  100eca:	eb 13                	jmp    100edf <cga_init+0x58>
    } else {                                                                // 如果读出来了，有这块显存，即是彩显配置
        *cp = was;                                                      //还原原来显存位置的值
  100ecc:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100ecf:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  100ed3:	66 89 10             	mov    %dx,(%eax)
        addr_6845 = CGA_BASE;                               // 设置为彩显控制的IO地址，CGA_BASE: 0x3D4 
  100ed6:	66 c7 05 66 fe 10 00 	movw   $0x3d4,0x10fe66
  100edd:	d4 03 
    // Extract cursor location
    // 6845索引寄存器的index 0x0E（及十进制的14）== 光标位置(高位)
    // 6845索引寄存器的index 0x0F（及十进制的15）== 光标位置(低位)
    // 6845 reg 15 : Cursor Address (Low Byte)
    uint32_t pos;
    outb(addr_6845, 14);                                        
  100edf:	0f b7 05 66 fe 10 00 	movzwl 0x10fe66,%eax
  100ee6:	66 89 45 e6          	mov    %ax,-0x1a(%ebp)
  100eea:	c6 45 e5 0e          	movb   $0xe,-0x1b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100eee:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  100ef2:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  100ef6:	ee                   	out    %al,(%dx)
}
  100ef7:	90                   	nop
    pos = inb(addr_6845 + 1) << 8;                       //读出了光标位置(高位)
  100ef8:	0f b7 05 66 fe 10 00 	movzwl 0x10fe66,%eax
  100eff:	40                   	inc    %eax
  100f00:	0f b7 c0             	movzwl %ax,%eax
  100f03:	66 89 45 ea          	mov    %ax,-0x16(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100f07:	0f b7 45 ea          	movzwl -0x16(%ebp),%eax
  100f0b:	89 c2                	mov    %eax,%edx
  100f0d:	ec                   	in     (%dx),%al
  100f0e:	88 45 e9             	mov    %al,-0x17(%ebp)
    return data;
  100f11:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  100f15:	0f b6 c0             	movzbl %al,%eax
  100f18:	c1 e0 08             	shl    $0x8,%eax
  100f1b:	89 45 f4             	mov    %eax,-0xc(%ebp)
    outb(addr_6845, 15);
  100f1e:	0f b7 05 66 fe 10 00 	movzwl 0x10fe66,%eax
  100f25:	66 89 45 ee          	mov    %ax,-0x12(%ebp)
  100f29:	c6 45 ed 0f          	movb   $0xf,-0x13(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100f2d:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100f31:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  100f35:	ee                   	out    %al,(%dx)
}
  100f36:	90                   	nop
    pos |= inb(addr_6845 + 1);                             //读出了光标位置(低位)
  100f37:	0f b7 05 66 fe 10 00 	movzwl 0x10fe66,%eax
  100f3e:	40                   	inc    %eax
  100f3f:	0f b7 c0             	movzwl %ax,%eax
  100f42:	66 89 45 f2          	mov    %ax,-0xe(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100f46:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  100f4a:	89 c2                	mov    %eax,%edx
  100f4c:	ec                   	in     (%dx),%al
  100f4d:	88 45 f1             	mov    %al,-0xf(%ebp)
    return data;
  100f50:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  100f54:	0f b6 c0             	movzbl %al,%eax
  100f57:	09 45 f4             	or     %eax,-0xc(%ebp)

    crt_buf = (uint16_t*) cp;                                  //crt_buf是CGA显存起始地址
  100f5a:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100f5d:	a3 60 fe 10 00       	mov    %eax,0x10fe60
    crt_pos = pos;                                                  //crt_pos是CGA当前光标位置
  100f62:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100f65:	0f b7 c0             	movzwl %ax,%eax
  100f68:	66 a3 64 fe 10 00    	mov    %ax,0x10fe64
}
  100f6e:	90                   	nop
  100f6f:	c9                   	leave  
  100f70:	c3                   	ret    

00100f71 <serial_init>:

static bool serial_exists = 0;

static void
serial_init(void) {
  100f71:	f3 0f 1e fb          	endbr32 
  100f75:	55                   	push   %ebp
  100f76:	89 e5                	mov    %esp,%ebp
  100f78:	83 ec 48             	sub    $0x48,%esp
  100f7b:	66 c7 45 d2 fa 03    	movw   $0x3fa,-0x2e(%ebp)
  100f81:	c6 45 d1 00          	movb   $0x0,-0x2f(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100f85:	0f b6 45 d1          	movzbl -0x2f(%ebp),%eax
  100f89:	0f b7 55 d2          	movzwl -0x2e(%ebp),%edx
  100f8d:	ee                   	out    %al,(%dx)
}
  100f8e:	90                   	nop
  100f8f:	66 c7 45 d6 fb 03    	movw   $0x3fb,-0x2a(%ebp)
  100f95:	c6 45 d5 80          	movb   $0x80,-0x2b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100f99:	0f b6 45 d5          	movzbl -0x2b(%ebp),%eax
  100f9d:	0f b7 55 d6          	movzwl -0x2a(%ebp),%edx
  100fa1:	ee                   	out    %al,(%dx)
}
  100fa2:	90                   	nop
  100fa3:	66 c7 45 da f8 03    	movw   $0x3f8,-0x26(%ebp)
  100fa9:	c6 45 d9 0c          	movb   $0xc,-0x27(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100fad:	0f b6 45 d9          	movzbl -0x27(%ebp),%eax
  100fb1:	0f b7 55 da          	movzwl -0x26(%ebp),%edx
  100fb5:	ee                   	out    %al,(%dx)
}
  100fb6:	90                   	nop
  100fb7:	66 c7 45 de f9 03    	movw   $0x3f9,-0x22(%ebp)
  100fbd:	c6 45 dd 00          	movb   $0x0,-0x23(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100fc1:	0f b6 45 dd          	movzbl -0x23(%ebp),%eax
  100fc5:	0f b7 55 de          	movzwl -0x22(%ebp),%edx
  100fc9:	ee                   	out    %al,(%dx)
}
  100fca:	90                   	nop
  100fcb:	66 c7 45 e2 fb 03    	movw   $0x3fb,-0x1e(%ebp)
  100fd1:	c6 45 e1 03          	movb   $0x3,-0x1f(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100fd5:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
  100fd9:	0f b7 55 e2          	movzwl -0x1e(%ebp),%edx
  100fdd:	ee                   	out    %al,(%dx)
}
  100fde:	90                   	nop
  100fdf:	66 c7 45 e6 fc 03    	movw   $0x3fc,-0x1a(%ebp)
  100fe5:	c6 45 e5 00          	movb   $0x0,-0x1b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100fe9:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  100fed:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  100ff1:	ee                   	out    %al,(%dx)
}
  100ff2:	90                   	nop
  100ff3:	66 c7 45 ea f9 03    	movw   $0x3f9,-0x16(%ebp)
  100ff9:	c6 45 e9 01          	movb   $0x1,-0x17(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100ffd:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  101001:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  101005:	ee                   	out    %al,(%dx)
}
  101006:	90                   	nop
  101007:	66 c7 45 ee fd 03    	movw   $0x3fd,-0x12(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  10100d:	0f b7 45 ee          	movzwl -0x12(%ebp),%eax
  101011:	89 c2                	mov    %eax,%edx
  101013:	ec                   	in     (%dx),%al
  101014:	88 45 ed             	mov    %al,-0x13(%ebp)
    return data;
  101017:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
    // Enable rcv interrupts
    outb(COM1 + COM_IER, COM_IER_RDI);

    // Clear any preexisting overrun indications and interrupts
    // Serial port doesn't exist if COM_LSR returns 0xFF
    serial_exists = (inb(COM1 + COM_LSR) != 0xFF);
  10101b:	3c ff                	cmp    $0xff,%al
  10101d:	0f 95 c0             	setne  %al
  101020:	0f b6 c0             	movzbl %al,%eax
  101023:	a3 68 fe 10 00       	mov    %eax,0x10fe68
  101028:	66 c7 45 f2 fa 03    	movw   $0x3fa,-0xe(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  10102e:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  101032:	89 c2                	mov    %eax,%edx
  101034:	ec                   	in     (%dx),%al
  101035:	88 45 f1             	mov    %al,-0xf(%ebp)
  101038:	66 c7 45 f6 f8 03    	movw   $0x3f8,-0xa(%ebp)
  10103e:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  101042:	89 c2                	mov    %eax,%edx
  101044:	ec                   	in     (%dx),%al
  101045:	88 45 f5             	mov    %al,-0xb(%ebp)
    (void) inb(COM1+COM_IIR);
    (void) inb(COM1+COM_RX);

    if (serial_exists) {
  101048:	a1 68 fe 10 00       	mov    0x10fe68,%eax
  10104d:	85 c0                	test   %eax,%eax
  10104f:	74 0c                	je     10105d <serial_init+0xec>
        pic_enable(IRQ_COM1);
  101051:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
  101058:	e8 0b 07 00 00       	call   101768 <pic_enable>
    }
}
  10105d:	90                   	nop
  10105e:	c9                   	leave  
  10105f:	c3                   	ret    

00101060 <lpt_putc_sub>:

static void
lpt_putc_sub(int c) {
  101060:	f3 0f 1e fb          	endbr32 
  101064:	55                   	push   %ebp
  101065:	89 e5                	mov    %esp,%ebp
  101067:	83 ec 20             	sub    $0x20,%esp
    int i;
    for (i = 0; !(inb(LPTPORT + 1) & 0x80) && i < 12800; i ++) {
  10106a:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  101071:	eb 08                	jmp    10107b <lpt_putc_sub+0x1b>
        delay();
  101073:	e8 c2 fd ff ff       	call   100e3a <delay>
    for (i = 0; !(inb(LPTPORT + 1) & 0x80) && i < 12800; i ++) {
  101078:	ff 45 fc             	incl   -0x4(%ebp)
  10107b:	66 c7 45 fa 79 03    	movw   $0x379,-0x6(%ebp)
  101081:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  101085:	89 c2                	mov    %eax,%edx
  101087:	ec                   	in     (%dx),%al
  101088:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  10108b:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  10108f:	84 c0                	test   %al,%al
  101091:	78 09                	js     10109c <lpt_putc_sub+0x3c>
  101093:	81 7d fc ff 31 00 00 	cmpl   $0x31ff,-0x4(%ebp)
  10109a:	7e d7                	jle    101073 <lpt_putc_sub+0x13>
    }
    outb(LPTPORT + 0, c);
  10109c:	8b 45 08             	mov    0x8(%ebp),%eax
  10109f:	0f b6 c0             	movzbl %al,%eax
  1010a2:	66 c7 45 ee 78 03    	movw   $0x378,-0x12(%ebp)
  1010a8:	88 45 ed             	mov    %al,-0x13(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1010ab:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  1010af:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  1010b3:	ee                   	out    %al,(%dx)
}
  1010b4:	90                   	nop
  1010b5:	66 c7 45 f2 7a 03    	movw   $0x37a,-0xe(%ebp)
  1010bb:	c6 45 f1 0d          	movb   $0xd,-0xf(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1010bf:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  1010c3:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  1010c7:	ee                   	out    %al,(%dx)
}
  1010c8:	90                   	nop
  1010c9:	66 c7 45 f6 7a 03    	movw   $0x37a,-0xa(%ebp)
  1010cf:	c6 45 f5 08          	movb   $0x8,-0xb(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1010d3:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  1010d7:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  1010db:	ee                   	out    %al,(%dx)
}
  1010dc:	90                   	nop
    outb(LPTPORT + 2, 0x08 | 0x04 | 0x01);
    outb(LPTPORT + 2, 0x08);
}
  1010dd:	90                   	nop
  1010de:	c9                   	leave  
  1010df:	c3                   	ret    

001010e0 <lpt_putc>:

/* lpt_putc - copy console output to parallel port */
static void
lpt_putc(int c) {
  1010e0:	f3 0f 1e fb          	endbr32 
  1010e4:	55                   	push   %ebp
  1010e5:	89 e5                	mov    %esp,%ebp
  1010e7:	83 ec 04             	sub    $0x4,%esp
    if (c != '\b') {
  1010ea:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  1010ee:	74 0d                	je     1010fd <lpt_putc+0x1d>
        lpt_putc_sub(c);
  1010f0:	8b 45 08             	mov    0x8(%ebp),%eax
  1010f3:	89 04 24             	mov    %eax,(%esp)
  1010f6:	e8 65 ff ff ff       	call   101060 <lpt_putc_sub>
    else {
        lpt_putc_sub('\b');
        lpt_putc_sub(' ');
        lpt_putc_sub('\b');
    }
}
  1010fb:	eb 24                	jmp    101121 <lpt_putc+0x41>
        lpt_putc_sub('\b');
  1010fd:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  101104:	e8 57 ff ff ff       	call   101060 <lpt_putc_sub>
        lpt_putc_sub(' ');
  101109:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  101110:	e8 4b ff ff ff       	call   101060 <lpt_putc_sub>
        lpt_putc_sub('\b');
  101115:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  10111c:	e8 3f ff ff ff       	call   101060 <lpt_putc_sub>
}
  101121:	90                   	nop
  101122:	c9                   	leave  
  101123:	c3                   	ret    

00101124 <cga_putc>:

/* cga_putc - print character to console */
static void
cga_putc(int c) {
  101124:	f3 0f 1e fb          	endbr32 
  101128:	55                   	push   %ebp
  101129:	89 e5                	mov    %esp,%ebp
  10112b:	53                   	push   %ebx
  10112c:	83 ec 34             	sub    $0x34,%esp
    // set black on white
    if (!(c & ~0xFF)) {
  10112f:	8b 45 08             	mov    0x8(%ebp),%eax
  101132:	25 00 ff ff ff       	and    $0xffffff00,%eax
  101137:	85 c0                	test   %eax,%eax
  101139:	75 07                	jne    101142 <cga_putc+0x1e>
        c |= 0x0700;
  10113b:	81 4d 08 00 07 00 00 	orl    $0x700,0x8(%ebp)
    }

    switch (c & 0xff) {
  101142:	8b 45 08             	mov    0x8(%ebp),%eax
  101145:	0f b6 c0             	movzbl %al,%eax
  101148:	83 f8 0d             	cmp    $0xd,%eax
  10114b:	74 72                	je     1011bf <cga_putc+0x9b>
  10114d:	83 f8 0d             	cmp    $0xd,%eax
  101150:	0f 8f a3 00 00 00    	jg     1011f9 <cga_putc+0xd5>
  101156:	83 f8 08             	cmp    $0x8,%eax
  101159:	74 0a                	je     101165 <cga_putc+0x41>
  10115b:	83 f8 0a             	cmp    $0xa,%eax
  10115e:	74 4c                	je     1011ac <cga_putc+0x88>
  101160:	e9 94 00 00 00       	jmp    1011f9 <cga_putc+0xd5>
    case '\b':
        if (crt_pos > 0) {
  101165:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  10116c:	85 c0                	test   %eax,%eax
  10116e:	0f 84 af 00 00 00    	je     101223 <cga_putc+0xff>
            crt_pos --;
  101174:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  10117b:	48                   	dec    %eax
  10117c:	0f b7 c0             	movzwl %ax,%eax
  10117f:	66 a3 64 fe 10 00    	mov    %ax,0x10fe64
            crt_buf[crt_pos] = (c & ~0xff) | ' ';
  101185:	8b 45 08             	mov    0x8(%ebp),%eax
  101188:	98                   	cwtl   
  101189:	25 00 ff ff ff       	and    $0xffffff00,%eax
  10118e:	98                   	cwtl   
  10118f:	83 c8 20             	or     $0x20,%eax
  101192:	98                   	cwtl   
  101193:	8b 15 60 fe 10 00    	mov    0x10fe60,%edx
  101199:	0f b7 0d 64 fe 10 00 	movzwl 0x10fe64,%ecx
  1011a0:	01 c9                	add    %ecx,%ecx
  1011a2:	01 ca                	add    %ecx,%edx
  1011a4:	0f b7 c0             	movzwl %ax,%eax
  1011a7:	66 89 02             	mov    %ax,(%edx)
        }
        break;
  1011aa:	eb 77                	jmp    101223 <cga_putc+0xff>
    case '\n':
        crt_pos += CRT_COLS;
  1011ac:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  1011b3:	83 c0 50             	add    $0x50,%eax
  1011b6:	0f b7 c0             	movzwl %ax,%eax
  1011b9:	66 a3 64 fe 10 00    	mov    %ax,0x10fe64
    case '\r':
        crt_pos -= (crt_pos % CRT_COLS);
  1011bf:	0f b7 1d 64 fe 10 00 	movzwl 0x10fe64,%ebx
  1011c6:	0f b7 0d 64 fe 10 00 	movzwl 0x10fe64,%ecx
  1011cd:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
  1011d2:	89 c8                	mov    %ecx,%eax
  1011d4:	f7 e2                	mul    %edx
  1011d6:	c1 ea 06             	shr    $0x6,%edx
  1011d9:	89 d0                	mov    %edx,%eax
  1011db:	c1 e0 02             	shl    $0x2,%eax
  1011de:	01 d0                	add    %edx,%eax
  1011e0:	c1 e0 04             	shl    $0x4,%eax
  1011e3:	29 c1                	sub    %eax,%ecx
  1011e5:	89 c8                	mov    %ecx,%eax
  1011e7:	0f b7 c0             	movzwl %ax,%eax
  1011ea:	29 c3                	sub    %eax,%ebx
  1011ec:	89 d8                	mov    %ebx,%eax
  1011ee:	0f b7 c0             	movzwl %ax,%eax
  1011f1:	66 a3 64 fe 10 00    	mov    %ax,0x10fe64
        break;
  1011f7:	eb 2b                	jmp    101224 <cga_putc+0x100>
    default:
        crt_buf[crt_pos ++] = c;     // write the character
  1011f9:	8b 0d 60 fe 10 00    	mov    0x10fe60,%ecx
  1011ff:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  101206:	8d 50 01             	lea    0x1(%eax),%edx
  101209:	0f b7 d2             	movzwl %dx,%edx
  10120c:	66 89 15 64 fe 10 00 	mov    %dx,0x10fe64
  101213:	01 c0                	add    %eax,%eax
  101215:	8d 14 01             	lea    (%ecx,%eax,1),%edx
  101218:	8b 45 08             	mov    0x8(%ebp),%eax
  10121b:	0f b7 c0             	movzwl %ax,%eax
  10121e:	66 89 02             	mov    %ax,(%edx)
        break;
  101221:	eb 01                	jmp    101224 <cga_putc+0x100>
        break;
  101223:	90                   	nop
    }

    // What is the purpose of this?
    if (crt_pos >= CRT_SIZE) {
  101224:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  10122b:	3d cf 07 00 00       	cmp    $0x7cf,%eax
  101230:	76 5d                	jbe    10128f <cga_putc+0x16b>
        int i;
        memmove(crt_buf, crt_buf + CRT_COLS, (CRT_SIZE - CRT_COLS) * sizeof(uint16_t));
  101232:	a1 60 fe 10 00       	mov    0x10fe60,%eax
  101237:	8d 90 a0 00 00 00    	lea    0xa0(%eax),%edx
  10123d:	a1 60 fe 10 00       	mov    0x10fe60,%eax
  101242:	c7 44 24 08 00 0f 00 	movl   $0xf00,0x8(%esp)
  101249:	00 
  10124a:	89 54 24 04          	mov    %edx,0x4(%esp)
  10124e:	89 04 24             	mov    %eax,(%esp)
  101251:	e8 a7 1b 00 00       	call   102dfd <memmove>
        for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i ++) {
  101256:	c7 45 f4 80 07 00 00 	movl   $0x780,-0xc(%ebp)
  10125d:	eb 14                	jmp    101273 <cga_putc+0x14f>
            crt_buf[i] = 0x0700 | ' ';
  10125f:	a1 60 fe 10 00       	mov    0x10fe60,%eax
  101264:	8b 55 f4             	mov    -0xc(%ebp),%edx
  101267:	01 d2                	add    %edx,%edx
  101269:	01 d0                	add    %edx,%eax
  10126b:	66 c7 00 20 07       	movw   $0x720,(%eax)
        for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i ++) {
  101270:	ff 45 f4             	incl   -0xc(%ebp)
  101273:	81 7d f4 cf 07 00 00 	cmpl   $0x7cf,-0xc(%ebp)
  10127a:	7e e3                	jle    10125f <cga_putc+0x13b>
        }
        crt_pos -= CRT_COLS;
  10127c:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  101283:	83 e8 50             	sub    $0x50,%eax
  101286:	0f b7 c0             	movzwl %ax,%eax
  101289:	66 a3 64 fe 10 00    	mov    %ax,0x10fe64
    }

    // move that little blinky thing
    outb(addr_6845, 14);
  10128f:	0f b7 05 66 fe 10 00 	movzwl 0x10fe66,%eax
  101296:	66 89 45 e6          	mov    %ax,-0x1a(%ebp)
  10129a:	c6 45 e5 0e          	movb   $0xe,-0x1b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10129e:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  1012a2:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  1012a6:	ee                   	out    %al,(%dx)
}
  1012a7:	90                   	nop
    outb(addr_6845 + 1, crt_pos >> 8);
  1012a8:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  1012af:	c1 e8 08             	shr    $0x8,%eax
  1012b2:	0f b7 c0             	movzwl %ax,%eax
  1012b5:	0f b6 c0             	movzbl %al,%eax
  1012b8:	0f b7 15 66 fe 10 00 	movzwl 0x10fe66,%edx
  1012bf:	42                   	inc    %edx
  1012c0:	0f b7 d2             	movzwl %dx,%edx
  1012c3:	66 89 55 ea          	mov    %dx,-0x16(%ebp)
  1012c7:	88 45 e9             	mov    %al,-0x17(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1012ca:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  1012ce:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  1012d2:	ee                   	out    %al,(%dx)
}
  1012d3:	90                   	nop
    outb(addr_6845, 15);
  1012d4:	0f b7 05 66 fe 10 00 	movzwl 0x10fe66,%eax
  1012db:	66 89 45 ee          	mov    %ax,-0x12(%ebp)
  1012df:	c6 45 ed 0f          	movb   $0xf,-0x13(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1012e3:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  1012e7:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  1012eb:	ee                   	out    %al,(%dx)
}
  1012ec:	90                   	nop
    outb(addr_6845 + 1, crt_pos);
  1012ed:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  1012f4:	0f b6 c0             	movzbl %al,%eax
  1012f7:	0f b7 15 66 fe 10 00 	movzwl 0x10fe66,%edx
  1012fe:	42                   	inc    %edx
  1012ff:	0f b7 d2             	movzwl %dx,%edx
  101302:	66 89 55 f2          	mov    %dx,-0xe(%ebp)
  101306:	88 45 f1             	mov    %al,-0xf(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101309:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  10130d:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  101311:	ee                   	out    %al,(%dx)
}
  101312:	90                   	nop
}
  101313:	90                   	nop
  101314:	83 c4 34             	add    $0x34,%esp
  101317:	5b                   	pop    %ebx
  101318:	5d                   	pop    %ebp
  101319:	c3                   	ret    

0010131a <serial_putc_sub>:

static void
serial_putc_sub(int c) {
  10131a:	f3 0f 1e fb          	endbr32 
  10131e:	55                   	push   %ebp
  10131f:	89 e5                	mov    %esp,%ebp
  101321:	83 ec 10             	sub    $0x10,%esp
    int i;
    for (i = 0; !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800; i ++) {
  101324:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  10132b:	eb 08                	jmp    101335 <serial_putc_sub+0x1b>
        delay();
  10132d:	e8 08 fb ff ff       	call   100e3a <delay>
    for (i = 0; !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800; i ++) {
  101332:	ff 45 fc             	incl   -0x4(%ebp)
  101335:	66 c7 45 fa fd 03    	movw   $0x3fd,-0x6(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  10133b:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  10133f:	89 c2                	mov    %eax,%edx
  101341:	ec                   	in     (%dx),%al
  101342:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  101345:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  101349:	0f b6 c0             	movzbl %al,%eax
  10134c:	83 e0 20             	and    $0x20,%eax
  10134f:	85 c0                	test   %eax,%eax
  101351:	75 09                	jne    10135c <serial_putc_sub+0x42>
  101353:	81 7d fc ff 31 00 00 	cmpl   $0x31ff,-0x4(%ebp)
  10135a:	7e d1                	jle    10132d <serial_putc_sub+0x13>
    }
    outb(COM1 + COM_TX, c);
  10135c:	8b 45 08             	mov    0x8(%ebp),%eax
  10135f:	0f b6 c0             	movzbl %al,%eax
  101362:	66 c7 45 f6 f8 03    	movw   $0x3f8,-0xa(%ebp)
  101368:	88 45 f5             	mov    %al,-0xb(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10136b:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  10136f:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  101373:	ee                   	out    %al,(%dx)
}
  101374:	90                   	nop
}
  101375:	90                   	nop
  101376:	c9                   	leave  
  101377:	c3                   	ret    

00101378 <serial_putc>:

/* serial_putc - print character to serial port */
static void
serial_putc(int c) {
  101378:	f3 0f 1e fb          	endbr32 
  10137c:	55                   	push   %ebp
  10137d:	89 e5                	mov    %esp,%ebp
  10137f:	83 ec 04             	sub    $0x4,%esp
    if (c != '\b') {
  101382:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  101386:	74 0d                	je     101395 <serial_putc+0x1d>
        serial_putc_sub(c);
  101388:	8b 45 08             	mov    0x8(%ebp),%eax
  10138b:	89 04 24             	mov    %eax,(%esp)
  10138e:	e8 87 ff ff ff       	call   10131a <serial_putc_sub>
    else {
        serial_putc_sub('\b');
        serial_putc_sub(' ');
        serial_putc_sub('\b');
    }
}
  101393:	eb 24                	jmp    1013b9 <serial_putc+0x41>
        serial_putc_sub('\b');
  101395:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  10139c:	e8 79 ff ff ff       	call   10131a <serial_putc_sub>
        serial_putc_sub(' ');
  1013a1:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  1013a8:	e8 6d ff ff ff       	call   10131a <serial_putc_sub>
        serial_putc_sub('\b');
  1013ad:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  1013b4:	e8 61 ff ff ff       	call   10131a <serial_putc_sub>
}
  1013b9:	90                   	nop
  1013ba:	c9                   	leave  
  1013bb:	c3                   	ret    

001013bc <cons_intr>:
/* *
 * cons_intr - called by device interrupt routines to feed input
 * characters into the circular console input buffer.
 * */
static void
cons_intr(int (*proc)(void)) {
  1013bc:	f3 0f 1e fb          	endbr32 
  1013c0:	55                   	push   %ebp
  1013c1:	89 e5                	mov    %esp,%ebp
  1013c3:	83 ec 18             	sub    $0x18,%esp
    int c;
    while ((c = (*proc)()) != -1) {
  1013c6:	eb 33                	jmp    1013fb <cons_intr+0x3f>
        if (c != 0) {
  1013c8:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1013cc:	74 2d                	je     1013fb <cons_intr+0x3f>
            cons.buf[cons.wpos ++] = c;
  1013ce:	a1 84 00 11 00       	mov    0x110084,%eax
  1013d3:	8d 50 01             	lea    0x1(%eax),%edx
  1013d6:	89 15 84 00 11 00    	mov    %edx,0x110084
  1013dc:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1013df:	88 90 80 fe 10 00    	mov    %dl,0x10fe80(%eax)
            if (cons.wpos == CONSBUFSIZE) {
  1013e5:	a1 84 00 11 00       	mov    0x110084,%eax
  1013ea:	3d 00 02 00 00       	cmp    $0x200,%eax
  1013ef:	75 0a                	jne    1013fb <cons_intr+0x3f>
                cons.wpos = 0;
  1013f1:	c7 05 84 00 11 00 00 	movl   $0x0,0x110084
  1013f8:	00 00 00 
    while ((c = (*proc)()) != -1) {
  1013fb:	8b 45 08             	mov    0x8(%ebp),%eax
  1013fe:	ff d0                	call   *%eax
  101400:	89 45 f4             	mov    %eax,-0xc(%ebp)
  101403:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
  101407:	75 bf                	jne    1013c8 <cons_intr+0xc>
            }
        }
    }
}
  101409:	90                   	nop
  10140a:	90                   	nop
  10140b:	c9                   	leave  
  10140c:	c3                   	ret    

0010140d <serial_proc_data>:

/* serial_proc_data - get data from serial port */
static int
serial_proc_data(void) {
  10140d:	f3 0f 1e fb          	endbr32 
  101411:	55                   	push   %ebp
  101412:	89 e5                	mov    %esp,%ebp
  101414:	83 ec 10             	sub    $0x10,%esp
  101417:	66 c7 45 fa fd 03    	movw   $0x3fd,-0x6(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  10141d:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  101421:	89 c2                	mov    %eax,%edx
  101423:	ec                   	in     (%dx),%al
  101424:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  101427:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
    if (!(inb(COM1 + COM_LSR) & COM_LSR_DATA)) {
  10142b:	0f b6 c0             	movzbl %al,%eax
  10142e:	83 e0 01             	and    $0x1,%eax
  101431:	85 c0                	test   %eax,%eax
  101433:	75 07                	jne    10143c <serial_proc_data+0x2f>
        return -1;
  101435:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  10143a:	eb 2a                	jmp    101466 <serial_proc_data+0x59>
  10143c:	66 c7 45 f6 f8 03    	movw   $0x3f8,-0xa(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  101442:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  101446:	89 c2                	mov    %eax,%edx
  101448:	ec                   	in     (%dx),%al
  101449:	88 45 f5             	mov    %al,-0xb(%ebp)
    return data;
  10144c:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
    }
    int c = inb(COM1 + COM_RX);
  101450:	0f b6 c0             	movzbl %al,%eax
  101453:	89 45 fc             	mov    %eax,-0x4(%ebp)
    if (c == 127) {
  101456:	83 7d fc 7f          	cmpl   $0x7f,-0x4(%ebp)
  10145a:	75 07                	jne    101463 <serial_proc_data+0x56>
        c = '\b';
  10145c:	c7 45 fc 08 00 00 00 	movl   $0x8,-0x4(%ebp)
    }
    return c;
  101463:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  101466:	c9                   	leave  
  101467:	c3                   	ret    

00101468 <serial_intr>:

/* serial_intr - try to feed input characters from serial port */
void
serial_intr(void) {
  101468:	f3 0f 1e fb          	endbr32 
  10146c:	55                   	push   %ebp
  10146d:	89 e5                	mov    %esp,%ebp
  10146f:	83 ec 18             	sub    $0x18,%esp
    if (serial_exists) {
  101472:	a1 68 fe 10 00       	mov    0x10fe68,%eax
  101477:	85 c0                	test   %eax,%eax
  101479:	74 0c                	je     101487 <serial_intr+0x1f>
        cons_intr(serial_proc_data);
  10147b:	c7 04 24 0d 14 10 00 	movl   $0x10140d,(%esp)
  101482:	e8 35 ff ff ff       	call   1013bc <cons_intr>
    }
}
  101487:	90                   	nop
  101488:	c9                   	leave  
  101489:	c3                   	ret    

0010148a <kbd_proc_data>:
 *
 * The kbd_proc_data() function gets data from the keyboard.
 * If we finish a character, return it, else 0. And return -1 if no data.
 * */
static int
kbd_proc_data(void) {
  10148a:	f3 0f 1e fb          	endbr32 
  10148e:	55                   	push   %ebp
  10148f:	89 e5                	mov    %esp,%ebp
  101491:	83 ec 38             	sub    $0x38,%esp
  101494:	66 c7 45 f0 64 00    	movw   $0x64,-0x10(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  10149a:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10149d:	89 c2                	mov    %eax,%edx
  10149f:	ec                   	in     (%dx),%al
  1014a0:	88 45 ef             	mov    %al,-0x11(%ebp)
    return data;
  1014a3:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    int c;
    uint8_t data;
    static uint32_t shift;

    if ((inb(KBSTATP) & KBS_DIB) == 0) {
  1014a7:	0f b6 c0             	movzbl %al,%eax
  1014aa:	83 e0 01             	and    $0x1,%eax
  1014ad:	85 c0                	test   %eax,%eax
  1014af:	75 0a                	jne    1014bb <kbd_proc_data+0x31>
        return -1;
  1014b1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1014b6:	e9 56 01 00 00       	jmp    101611 <kbd_proc_data+0x187>
  1014bb:	66 c7 45 ec 60 00    	movw   $0x60,-0x14(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  1014c1:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1014c4:	89 c2                	mov    %eax,%edx
  1014c6:	ec                   	in     (%dx),%al
  1014c7:	88 45 eb             	mov    %al,-0x15(%ebp)
    return data;
  1014ca:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
    }

    data = inb(KBDATAP);
  1014ce:	88 45 f3             	mov    %al,-0xd(%ebp)

    if (data == 0xE0) {
  1014d1:	80 7d f3 e0          	cmpb   $0xe0,-0xd(%ebp)
  1014d5:	75 17                	jne    1014ee <kbd_proc_data+0x64>
        // E0 escape character
        shift |= E0ESC;
  1014d7:	a1 88 00 11 00       	mov    0x110088,%eax
  1014dc:	83 c8 40             	or     $0x40,%eax
  1014df:	a3 88 00 11 00       	mov    %eax,0x110088
        return 0;
  1014e4:	b8 00 00 00 00       	mov    $0x0,%eax
  1014e9:	e9 23 01 00 00       	jmp    101611 <kbd_proc_data+0x187>
    } else if (data & 0x80) {
  1014ee:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1014f2:	84 c0                	test   %al,%al
  1014f4:	79 45                	jns    10153b <kbd_proc_data+0xb1>
        // Key released
        data = (shift & E0ESC ? data : data & 0x7F);
  1014f6:	a1 88 00 11 00       	mov    0x110088,%eax
  1014fb:	83 e0 40             	and    $0x40,%eax
  1014fe:	85 c0                	test   %eax,%eax
  101500:	75 08                	jne    10150a <kbd_proc_data+0x80>
  101502:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101506:	24 7f                	and    $0x7f,%al
  101508:	eb 04                	jmp    10150e <kbd_proc_data+0x84>
  10150a:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  10150e:	88 45 f3             	mov    %al,-0xd(%ebp)
        shift &= ~(shiftcode[data] | E0ESC);
  101511:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101515:	0f b6 80 40 f0 10 00 	movzbl 0x10f040(%eax),%eax
  10151c:	0c 40                	or     $0x40,%al
  10151e:	0f b6 c0             	movzbl %al,%eax
  101521:	f7 d0                	not    %eax
  101523:	89 c2                	mov    %eax,%edx
  101525:	a1 88 00 11 00       	mov    0x110088,%eax
  10152a:	21 d0                	and    %edx,%eax
  10152c:	a3 88 00 11 00       	mov    %eax,0x110088
        return 0;
  101531:	b8 00 00 00 00       	mov    $0x0,%eax
  101536:	e9 d6 00 00 00       	jmp    101611 <kbd_proc_data+0x187>
    } else if (shift & E0ESC) {
  10153b:	a1 88 00 11 00       	mov    0x110088,%eax
  101540:	83 e0 40             	and    $0x40,%eax
  101543:	85 c0                	test   %eax,%eax
  101545:	74 11                	je     101558 <kbd_proc_data+0xce>
        // Last character was an E0 escape; or with 0x80
        data |= 0x80;
  101547:	80 4d f3 80          	orb    $0x80,-0xd(%ebp)
        shift &= ~E0ESC;
  10154b:	a1 88 00 11 00       	mov    0x110088,%eax
  101550:	83 e0 bf             	and    $0xffffffbf,%eax
  101553:	a3 88 00 11 00       	mov    %eax,0x110088
    }

    shift |= shiftcode[data];
  101558:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  10155c:	0f b6 80 40 f0 10 00 	movzbl 0x10f040(%eax),%eax
  101563:	0f b6 d0             	movzbl %al,%edx
  101566:	a1 88 00 11 00       	mov    0x110088,%eax
  10156b:	09 d0                	or     %edx,%eax
  10156d:	a3 88 00 11 00       	mov    %eax,0x110088
    shift ^= togglecode[data];
  101572:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101576:	0f b6 80 40 f1 10 00 	movzbl 0x10f140(%eax),%eax
  10157d:	0f b6 d0             	movzbl %al,%edx
  101580:	a1 88 00 11 00       	mov    0x110088,%eax
  101585:	31 d0                	xor    %edx,%eax
  101587:	a3 88 00 11 00       	mov    %eax,0x110088

    c = charcode[shift & (CTL | SHIFT)][data];
  10158c:	a1 88 00 11 00       	mov    0x110088,%eax
  101591:	83 e0 03             	and    $0x3,%eax
  101594:	8b 14 85 40 f5 10 00 	mov    0x10f540(,%eax,4),%edx
  10159b:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  10159f:	01 d0                	add    %edx,%eax
  1015a1:	0f b6 00             	movzbl (%eax),%eax
  1015a4:	0f b6 c0             	movzbl %al,%eax
  1015a7:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if (shift & CAPSLOCK) {
  1015aa:	a1 88 00 11 00       	mov    0x110088,%eax
  1015af:	83 e0 08             	and    $0x8,%eax
  1015b2:	85 c0                	test   %eax,%eax
  1015b4:	74 22                	je     1015d8 <kbd_proc_data+0x14e>
        if ('a' <= c && c <= 'z')
  1015b6:	83 7d f4 60          	cmpl   $0x60,-0xc(%ebp)
  1015ba:	7e 0c                	jle    1015c8 <kbd_proc_data+0x13e>
  1015bc:	83 7d f4 7a          	cmpl   $0x7a,-0xc(%ebp)
  1015c0:	7f 06                	jg     1015c8 <kbd_proc_data+0x13e>
            c += 'A' - 'a';
  1015c2:	83 6d f4 20          	subl   $0x20,-0xc(%ebp)
  1015c6:	eb 10                	jmp    1015d8 <kbd_proc_data+0x14e>
        else if ('A' <= c && c <= 'Z')
  1015c8:	83 7d f4 40          	cmpl   $0x40,-0xc(%ebp)
  1015cc:	7e 0a                	jle    1015d8 <kbd_proc_data+0x14e>
  1015ce:	83 7d f4 5a          	cmpl   $0x5a,-0xc(%ebp)
  1015d2:	7f 04                	jg     1015d8 <kbd_proc_data+0x14e>
            c += 'a' - 'A';
  1015d4:	83 45 f4 20          	addl   $0x20,-0xc(%ebp)
    }

    // Process special keys
    // Ctrl-Alt-Del: reboot
    if (!(~shift & (CTL | ALT)) && c == KEY_DEL) {
  1015d8:	a1 88 00 11 00       	mov    0x110088,%eax
  1015dd:	f7 d0                	not    %eax
  1015df:	83 e0 06             	and    $0x6,%eax
  1015e2:	85 c0                	test   %eax,%eax
  1015e4:	75 28                	jne    10160e <kbd_proc_data+0x184>
  1015e6:	81 7d f4 e9 00 00 00 	cmpl   $0xe9,-0xc(%ebp)
  1015ed:	75 1f                	jne    10160e <kbd_proc_data+0x184>
        cprintf("Rebooting!\n");
  1015ef:	c7 04 24 0d 39 10 00 	movl   $0x10390d,(%esp)
  1015f6:	e8 89 ec ff ff       	call   100284 <cprintf>
  1015fb:	66 c7 45 e8 92 00    	movw   $0x92,-0x18(%ebp)
  101601:	c6 45 e7 03          	movb   $0x3,-0x19(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101605:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
  101609:	8b 55 e8             	mov    -0x18(%ebp),%edx
  10160c:	ee                   	out    %al,(%dx)
}
  10160d:	90                   	nop
        outb(0x92, 0x3); // courtesy of Chris Frost
    }
    return c;
  10160e:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  101611:	c9                   	leave  
  101612:	c3                   	ret    

00101613 <kbd_intr>:

/* kbd_intr - try to feed input characters from keyboard */
static void
kbd_intr(void) {
  101613:	f3 0f 1e fb          	endbr32 
  101617:	55                   	push   %ebp
  101618:	89 e5                	mov    %esp,%ebp
  10161a:	83 ec 18             	sub    $0x18,%esp
    cons_intr(kbd_proc_data);
  10161d:	c7 04 24 8a 14 10 00 	movl   $0x10148a,(%esp)
  101624:	e8 93 fd ff ff       	call   1013bc <cons_intr>
}
  101629:	90                   	nop
  10162a:	c9                   	leave  
  10162b:	c3                   	ret    

0010162c <kbd_init>:

static void
kbd_init(void) {
  10162c:	f3 0f 1e fb          	endbr32 
  101630:	55                   	push   %ebp
  101631:	89 e5                	mov    %esp,%ebp
  101633:	83 ec 18             	sub    $0x18,%esp
    // drain the kbd buffer
    kbd_intr();
  101636:	e8 d8 ff ff ff       	call   101613 <kbd_intr>
    pic_enable(IRQ_KBD);
  10163b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  101642:	e8 21 01 00 00       	call   101768 <pic_enable>
}
  101647:	90                   	nop
  101648:	c9                   	leave  
  101649:	c3                   	ret    

0010164a <cons_init>:

/* cons_init - initializes the console devices */
void
cons_init(void) {
  10164a:	f3 0f 1e fb          	endbr32 
  10164e:	55                   	push   %ebp
  10164f:	89 e5                	mov    %esp,%ebp
  101651:	83 ec 18             	sub    $0x18,%esp
    cga_init();
  101654:	e8 2e f8 ff ff       	call   100e87 <cga_init>
    serial_init();
  101659:	e8 13 f9 ff ff       	call   100f71 <serial_init>
    kbd_init();
  10165e:	e8 c9 ff ff ff       	call   10162c <kbd_init>
    if (!serial_exists) {
  101663:	a1 68 fe 10 00       	mov    0x10fe68,%eax
  101668:	85 c0                	test   %eax,%eax
  10166a:	75 0c                	jne    101678 <cons_init+0x2e>
        cprintf("serial port does not exist!!\n");
  10166c:	c7 04 24 19 39 10 00 	movl   $0x103919,(%esp)
  101673:	e8 0c ec ff ff       	call   100284 <cprintf>
    }
}
  101678:	90                   	nop
  101679:	c9                   	leave  
  10167a:	c3                   	ret    

0010167b <cons_putc>:

/* cons_putc - print a single character @c to console devices */
void
cons_putc(int c) {
  10167b:	f3 0f 1e fb          	endbr32 
  10167f:	55                   	push   %ebp
  101680:	89 e5                	mov    %esp,%ebp
  101682:	83 ec 18             	sub    $0x18,%esp
    lpt_putc(c);
  101685:	8b 45 08             	mov    0x8(%ebp),%eax
  101688:	89 04 24             	mov    %eax,(%esp)
  10168b:	e8 50 fa ff ff       	call   1010e0 <lpt_putc>
    cga_putc(c);
  101690:	8b 45 08             	mov    0x8(%ebp),%eax
  101693:	89 04 24             	mov    %eax,(%esp)
  101696:	e8 89 fa ff ff       	call   101124 <cga_putc>
    serial_putc(c);
  10169b:	8b 45 08             	mov    0x8(%ebp),%eax
  10169e:	89 04 24             	mov    %eax,(%esp)
  1016a1:	e8 d2 fc ff ff       	call   101378 <serial_putc>
}
  1016a6:	90                   	nop
  1016a7:	c9                   	leave  
  1016a8:	c3                   	ret    

001016a9 <cons_getc>:
/* *
 * cons_getc - return the next input character from console,
 * or 0 if none waiting.
 * */
int
cons_getc(void) {
  1016a9:	f3 0f 1e fb          	endbr32 
  1016ad:	55                   	push   %ebp
  1016ae:	89 e5                	mov    %esp,%ebp
  1016b0:	83 ec 18             	sub    $0x18,%esp
    int c;

    // poll for any pending input characters,
    // so that this function works even when interrupts are disabled
    // (e.g., when called from the kernel monitor).
    serial_intr();
  1016b3:	e8 b0 fd ff ff       	call   101468 <serial_intr>
    kbd_intr();
  1016b8:	e8 56 ff ff ff       	call   101613 <kbd_intr>

    // grab the next character from the input buffer.
    if (cons.rpos != cons.wpos) {
  1016bd:	8b 15 80 00 11 00    	mov    0x110080,%edx
  1016c3:	a1 84 00 11 00       	mov    0x110084,%eax
  1016c8:	39 c2                	cmp    %eax,%edx
  1016ca:	74 36                	je     101702 <cons_getc+0x59>
        c = cons.buf[cons.rpos ++];
  1016cc:	a1 80 00 11 00       	mov    0x110080,%eax
  1016d1:	8d 50 01             	lea    0x1(%eax),%edx
  1016d4:	89 15 80 00 11 00    	mov    %edx,0x110080
  1016da:	0f b6 80 80 fe 10 00 	movzbl 0x10fe80(%eax),%eax
  1016e1:	0f b6 c0             	movzbl %al,%eax
  1016e4:	89 45 f4             	mov    %eax,-0xc(%ebp)
        if (cons.rpos == CONSBUFSIZE) {
  1016e7:	a1 80 00 11 00       	mov    0x110080,%eax
  1016ec:	3d 00 02 00 00       	cmp    $0x200,%eax
  1016f1:	75 0a                	jne    1016fd <cons_getc+0x54>
            cons.rpos = 0;
  1016f3:	c7 05 80 00 11 00 00 	movl   $0x0,0x110080
  1016fa:	00 00 00 
        }
        return c;
  1016fd:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101700:	eb 05                	jmp    101707 <cons_getc+0x5e>
    }
    return 0;
  101702:	b8 00 00 00 00       	mov    $0x0,%eax
}
  101707:	c9                   	leave  
  101708:	c3                   	ret    

00101709 <pic_setmask>:
// Initial IRQ mask has interrupt 2 enabled (for slave 8259A).
static uint16_t irq_mask = 0xFFFF & ~(1 << IRQ_SLAVE);
static bool did_init = 0;

static void
pic_setmask(uint16_t mask) {
  101709:	f3 0f 1e fb          	endbr32 
  10170d:	55                   	push   %ebp
  10170e:	89 e5                	mov    %esp,%ebp
  101710:	83 ec 14             	sub    $0x14,%esp
  101713:	8b 45 08             	mov    0x8(%ebp),%eax
  101716:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
    irq_mask = mask;
  10171a:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10171d:	66 a3 50 f5 10 00    	mov    %ax,0x10f550
    if (did_init) {
  101723:	a1 8c 00 11 00       	mov    0x11008c,%eax
  101728:	85 c0                	test   %eax,%eax
  10172a:	74 39                	je     101765 <pic_setmask+0x5c>
        outb(IO_PIC1 + 1, mask);
  10172c:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10172f:	0f b6 c0             	movzbl %al,%eax
  101732:	66 c7 45 fa 21 00    	movw   $0x21,-0x6(%ebp)
  101738:	88 45 f9             	mov    %al,-0x7(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10173b:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  10173f:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  101743:	ee                   	out    %al,(%dx)
}
  101744:	90                   	nop
        outb(IO_PIC2 + 1, mask >> 8);
  101745:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  101749:	c1 e8 08             	shr    $0x8,%eax
  10174c:	0f b7 c0             	movzwl %ax,%eax
  10174f:	0f b6 c0             	movzbl %al,%eax
  101752:	66 c7 45 fe a1 00    	movw   $0xa1,-0x2(%ebp)
  101758:	88 45 fd             	mov    %al,-0x3(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10175b:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
  10175f:	0f b7 55 fe          	movzwl -0x2(%ebp),%edx
  101763:	ee                   	out    %al,(%dx)
}
  101764:	90                   	nop
    }
}
  101765:	90                   	nop
  101766:	c9                   	leave  
  101767:	c3                   	ret    

00101768 <pic_enable>:

void
pic_enable(unsigned int irq) {
  101768:	f3 0f 1e fb          	endbr32 
  10176c:	55                   	push   %ebp
  10176d:	89 e5                	mov    %esp,%ebp
  10176f:	83 ec 04             	sub    $0x4,%esp
    pic_setmask(irq_mask & ~(1 << irq));
  101772:	8b 45 08             	mov    0x8(%ebp),%eax
  101775:	ba 01 00 00 00       	mov    $0x1,%edx
  10177a:	88 c1                	mov    %al,%cl
  10177c:	d3 e2                	shl    %cl,%edx
  10177e:	89 d0                	mov    %edx,%eax
  101780:	98                   	cwtl   
  101781:	f7 d0                	not    %eax
  101783:	0f bf d0             	movswl %ax,%edx
  101786:	0f b7 05 50 f5 10 00 	movzwl 0x10f550,%eax
  10178d:	98                   	cwtl   
  10178e:	21 d0                	and    %edx,%eax
  101790:	98                   	cwtl   
  101791:	0f b7 c0             	movzwl %ax,%eax
  101794:	89 04 24             	mov    %eax,(%esp)
  101797:	e8 6d ff ff ff       	call   101709 <pic_setmask>
}
  10179c:	90                   	nop
  10179d:	c9                   	leave  
  10179e:	c3                   	ret    

0010179f <pic_init>:

/* pic_init - initialize the 8259A interrupt controllers */
void
pic_init(void) {
  10179f:	f3 0f 1e fb          	endbr32 
  1017a3:	55                   	push   %ebp
  1017a4:	89 e5                	mov    %esp,%ebp
  1017a6:	83 ec 44             	sub    $0x44,%esp
    did_init = 1;
  1017a9:	c7 05 8c 00 11 00 01 	movl   $0x1,0x11008c
  1017b0:	00 00 00 
  1017b3:	66 c7 45 ca 21 00    	movw   $0x21,-0x36(%ebp)
  1017b9:	c6 45 c9 ff          	movb   $0xff,-0x37(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1017bd:	0f b6 45 c9          	movzbl -0x37(%ebp),%eax
  1017c1:	0f b7 55 ca          	movzwl -0x36(%ebp),%edx
  1017c5:	ee                   	out    %al,(%dx)
}
  1017c6:	90                   	nop
  1017c7:	66 c7 45 ce a1 00    	movw   $0xa1,-0x32(%ebp)
  1017cd:	c6 45 cd ff          	movb   $0xff,-0x33(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1017d1:	0f b6 45 cd          	movzbl -0x33(%ebp),%eax
  1017d5:	0f b7 55 ce          	movzwl -0x32(%ebp),%edx
  1017d9:	ee                   	out    %al,(%dx)
}
  1017da:	90                   	nop
  1017db:	66 c7 45 d2 20 00    	movw   $0x20,-0x2e(%ebp)
  1017e1:	c6 45 d1 11          	movb   $0x11,-0x2f(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1017e5:	0f b6 45 d1          	movzbl -0x2f(%ebp),%eax
  1017e9:	0f b7 55 d2          	movzwl -0x2e(%ebp),%edx
  1017ed:	ee                   	out    %al,(%dx)
}
  1017ee:	90                   	nop
  1017ef:	66 c7 45 d6 21 00    	movw   $0x21,-0x2a(%ebp)
  1017f5:	c6 45 d5 20          	movb   $0x20,-0x2b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1017f9:	0f b6 45 d5          	movzbl -0x2b(%ebp),%eax
  1017fd:	0f b7 55 d6          	movzwl -0x2a(%ebp),%edx
  101801:	ee                   	out    %al,(%dx)
}
  101802:	90                   	nop
  101803:	66 c7 45 da 21 00    	movw   $0x21,-0x26(%ebp)
  101809:	c6 45 d9 04          	movb   $0x4,-0x27(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10180d:	0f b6 45 d9          	movzbl -0x27(%ebp),%eax
  101811:	0f b7 55 da          	movzwl -0x26(%ebp),%edx
  101815:	ee                   	out    %al,(%dx)
}
  101816:	90                   	nop
  101817:	66 c7 45 de 21 00    	movw   $0x21,-0x22(%ebp)
  10181d:	c6 45 dd 03          	movb   $0x3,-0x23(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101821:	0f b6 45 dd          	movzbl -0x23(%ebp),%eax
  101825:	0f b7 55 de          	movzwl -0x22(%ebp),%edx
  101829:	ee                   	out    %al,(%dx)
}
  10182a:	90                   	nop
  10182b:	66 c7 45 e2 a0 00    	movw   $0xa0,-0x1e(%ebp)
  101831:	c6 45 e1 11          	movb   $0x11,-0x1f(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101835:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
  101839:	0f b7 55 e2          	movzwl -0x1e(%ebp),%edx
  10183d:	ee                   	out    %al,(%dx)
}
  10183e:	90                   	nop
  10183f:	66 c7 45 e6 a1 00    	movw   $0xa1,-0x1a(%ebp)
  101845:	c6 45 e5 28          	movb   $0x28,-0x1b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101849:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  10184d:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  101851:	ee                   	out    %al,(%dx)
}
  101852:	90                   	nop
  101853:	66 c7 45 ea a1 00    	movw   $0xa1,-0x16(%ebp)
  101859:	c6 45 e9 02          	movb   $0x2,-0x17(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10185d:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  101861:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  101865:	ee                   	out    %al,(%dx)
}
  101866:	90                   	nop
  101867:	66 c7 45 ee a1 00    	movw   $0xa1,-0x12(%ebp)
  10186d:	c6 45 ed 03          	movb   $0x3,-0x13(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101871:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  101875:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  101879:	ee                   	out    %al,(%dx)
}
  10187a:	90                   	nop
  10187b:	66 c7 45 f2 20 00    	movw   $0x20,-0xe(%ebp)
  101881:	c6 45 f1 68          	movb   $0x68,-0xf(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101885:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  101889:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  10188d:	ee                   	out    %al,(%dx)
}
  10188e:	90                   	nop
  10188f:	66 c7 45 f6 20 00    	movw   $0x20,-0xa(%ebp)
  101895:	c6 45 f5 0a          	movb   $0xa,-0xb(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101899:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  10189d:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  1018a1:	ee                   	out    %al,(%dx)
}
  1018a2:	90                   	nop
  1018a3:	66 c7 45 fa a0 00    	movw   $0xa0,-0x6(%ebp)
  1018a9:	c6 45 f9 68          	movb   $0x68,-0x7(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1018ad:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  1018b1:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  1018b5:	ee                   	out    %al,(%dx)
}
  1018b6:	90                   	nop
  1018b7:	66 c7 45 fe a0 00    	movw   $0xa0,-0x2(%ebp)
  1018bd:	c6 45 fd 0a          	movb   $0xa,-0x3(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1018c1:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
  1018c5:	0f b7 55 fe          	movzwl -0x2(%ebp),%edx
  1018c9:	ee                   	out    %al,(%dx)
}
  1018ca:	90                   	nop
    outb(IO_PIC1, 0x0a);    // read IRR by default

    outb(IO_PIC2, 0x68);    // OCW3
    outb(IO_PIC2, 0x0a);    // OCW3

    if (irq_mask != 0xFFFF) {
  1018cb:	0f b7 05 50 f5 10 00 	movzwl 0x10f550,%eax
  1018d2:	3d ff ff 00 00       	cmp    $0xffff,%eax
  1018d7:	74 0f                	je     1018e8 <pic_init+0x149>
        pic_setmask(irq_mask);
  1018d9:	0f b7 05 50 f5 10 00 	movzwl 0x10f550,%eax
  1018e0:	89 04 24             	mov    %eax,(%esp)
  1018e3:	e8 21 fe ff ff       	call   101709 <pic_setmask>
    }
}
  1018e8:	90                   	nop
  1018e9:	c9                   	leave  
  1018ea:	c3                   	ret    

001018eb <intr_enable>:
#include <x86.h>
#include <intr.h>

/* intr_enable - enable irq interrupt */
void
intr_enable(void) {
  1018eb:	f3 0f 1e fb          	endbr32 
  1018ef:	55                   	push   %ebp
  1018f0:	89 e5                	mov    %esp,%ebp
    asm volatile ("lidt (%0)" :: "r" (pd));
}

static inline void
sti(void) {
    asm volatile ("sti");
  1018f2:	fb                   	sti    
}
  1018f3:	90                   	nop
    sti();
}
  1018f4:	90                   	nop
  1018f5:	5d                   	pop    %ebp
  1018f6:	c3                   	ret    

001018f7 <intr_disable>:

/* intr_disable - disable irq interrupt */
void
intr_disable(void) {
  1018f7:	f3 0f 1e fb          	endbr32 
  1018fb:	55                   	push   %ebp
  1018fc:	89 e5                	mov    %esp,%ebp

static inline void
cli(void) {
    asm volatile ("cli");
  1018fe:	fa                   	cli    
}
  1018ff:	90                   	nop
    cli();
}
  101900:	90                   	nop
  101901:	5d                   	pop    %ebp
  101902:	c3                   	ret    

00101903 <print_ticks>:
#include <console.h>
#include <kdebug.h>

#define TICK_NUM 500

static void print_ticks() {
  101903:	f3 0f 1e fb          	endbr32 
  101907:	55                   	push   %ebp
  101908:	89 e5                	mov    %esp,%ebp
  10190a:	83 ec 18             	sub    $0x18,%esp
    cprintf("%d ticks\n",TICK_NUM);
  10190d:	c7 44 24 04 f4 01 00 	movl   $0x1f4,0x4(%esp)
  101914:	00 
  101915:	c7 04 24 40 39 10 00 	movl   $0x103940,(%esp)
  10191c:	e8 63 e9 ff ff       	call   100284 <cprintf>
#ifdef DEBUG_GRADE
    cprintf("End of Test.\n");
    panic("EOT: kernel seems ok.");
#endif
}
  101921:	90                   	nop
  101922:	c9                   	leave  
  101923:	c3                   	ret    

00101924 <idt_init>:
    sizeof(idt) - 1, (uintptr_t)idt
};

/* idt_init - initialize IDT to each of the entry points in kern/trap/vectors.S */
void
idt_init(void) {
  101924:	f3 0f 1e fb          	endbr32 
  101928:	55                   	push   %ebp
  101929:	89 e5                	mov    %esp,%ebp
  10192b:	83 ec 10             	sub    $0x10,%esp
      *     You don't know the meaning of this instruction? just google it! and check the libs/x86.h to know more.
      *     Notice: the argument of lidt is idt_pd. try to find it!
      */

     extern uintptr_t __vectors[];
     for(int i = 0;i < 256 ; i++)
  10192e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  101935:	e9 c4 00 00 00       	jmp    1019fe <idt_init+0xda>
     {
         SETGATE(idt[i], 0, GD_KTEXT, __vectors[i], DPL_KERNEL);
  10193a:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10193d:	8b 04 85 e0 f5 10 00 	mov    0x10f5e0(,%eax,4),%eax
  101944:	0f b7 d0             	movzwl %ax,%edx
  101947:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10194a:	66 89 14 c5 a0 00 11 	mov    %dx,0x1100a0(,%eax,8)
  101951:	00 
  101952:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101955:	66 c7 04 c5 a2 00 11 	movw   $0x8,0x1100a2(,%eax,8)
  10195c:	00 08 00 
  10195f:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101962:	0f b6 14 c5 a4 00 11 	movzbl 0x1100a4(,%eax,8),%edx
  101969:	00 
  10196a:	80 e2 e0             	and    $0xe0,%dl
  10196d:	88 14 c5 a4 00 11 00 	mov    %dl,0x1100a4(,%eax,8)
  101974:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101977:	0f b6 14 c5 a4 00 11 	movzbl 0x1100a4(,%eax,8),%edx
  10197e:	00 
  10197f:	80 e2 1f             	and    $0x1f,%dl
  101982:	88 14 c5 a4 00 11 00 	mov    %dl,0x1100a4(,%eax,8)
  101989:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10198c:	0f b6 14 c5 a5 00 11 	movzbl 0x1100a5(,%eax,8),%edx
  101993:	00 
  101994:	80 e2 f0             	and    $0xf0,%dl
  101997:	80 ca 0e             	or     $0xe,%dl
  10199a:	88 14 c5 a5 00 11 00 	mov    %dl,0x1100a5(,%eax,8)
  1019a1:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1019a4:	0f b6 14 c5 a5 00 11 	movzbl 0x1100a5(,%eax,8),%edx
  1019ab:	00 
  1019ac:	80 e2 ef             	and    $0xef,%dl
  1019af:	88 14 c5 a5 00 11 00 	mov    %dl,0x1100a5(,%eax,8)
  1019b6:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1019b9:	0f b6 14 c5 a5 00 11 	movzbl 0x1100a5(,%eax,8),%edx
  1019c0:	00 
  1019c1:	80 e2 9f             	and    $0x9f,%dl
  1019c4:	88 14 c5 a5 00 11 00 	mov    %dl,0x1100a5(,%eax,8)
  1019cb:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1019ce:	0f b6 14 c5 a5 00 11 	movzbl 0x1100a5(,%eax,8),%edx
  1019d5:	00 
  1019d6:	80 ca 80             	or     $0x80,%dl
  1019d9:	88 14 c5 a5 00 11 00 	mov    %dl,0x1100a5(,%eax,8)
  1019e0:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1019e3:	8b 04 85 e0 f5 10 00 	mov    0x10f5e0(,%eax,4),%eax
  1019ea:	c1 e8 10             	shr    $0x10,%eax
  1019ed:	0f b7 d0             	movzwl %ax,%edx
  1019f0:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1019f3:	66 89 14 c5 a6 00 11 	mov    %dx,0x1100a6(,%eax,8)
  1019fa:	00 
     for(int i = 0;i < 256 ; i++)
  1019fb:	ff 45 fc             	incl   -0x4(%ebp)
  1019fe:	81 7d fc ff 00 00 00 	cmpl   $0xff,-0x4(%ebp)
  101a05:	0f 8e 2f ff ff ff    	jle    10193a <idt_init+0x16>
     }
     
     SETGATE(idt[T_SYSCALL], 0, GD_KTEXT, __vectors[T_SYSCALL], DPL_USER);
  101a0b:	a1 e0 f7 10 00       	mov    0x10f7e0,%eax
  101a10:	0f b7 c0             	movzwl %ax,%eax
  101a13:	66 a3 a0 04 11 00    	mov    %ax,0x1104a0
  101a19:	66 c7 05 a2 04 11 00 	movw   $0x8,0x1104a2
  101a20:	08 00 
  101a22:	0f b6 05 a4 04 11 00 	movzbl 0x1104a4,%eax
  101a29:	24 e0                	and    $0xe0,%al
  101a2b:	a2 a4 04 11 00       	mov    %al,0x1104a4
  101a30:	0f b6 05 a4 04 11 00 	movzbl 0x1104a4,%eax
  101a37:	24 1f                	and    $0x1f,%al
  101a39:	a2 a4 04 11 00       	mov    %al,0x1104a4
  101a3e:	0f b6 05 a5 04 11 00 	movzbl 0x1104a5,%eax
  101a45:	24 f0                	and    $0xf0,%al
  101a47:	0c 0e                	or     $0xe,%al
  101a49:	a2 a5 04 11 00       	mov    %al,0x1104a5
  101a4e:	0f b6 05 a5 04 11 00 	movzbl 0x1104a5,%eax
  101a55:	24 ef                	and    $0xef,%al
  101a57:	a2 a5 04 11 00       	mov    %al,0x1104a5
  101a5c:	0f b6 05 a5 04 11 00 	movzbl 0x1104a5,%eax
  101a63:	0c 60                	or     $0x60,%al
  101a65:	a2 a5 04 11 00       	mov    %al,0x1104a5
  101a6a:	0f b6 05 a5 04 11 00 	movzbl 0x1104a5,%eax
  101a71:	0c 80                	or     $0x80,%al
  101a73:	a2 a5 04 11 00       	mov    %al,0x1104a5
  101a78:	a1 e0 f7 10 00       	mov    0x10f7e0,%eax
  101a7d:	c1 e8 10             	shr    $0x10,%eax
  101a80:	0f b7 c0             	movzwl %ax,%eax
  101a83:	66 a3 a6 04 11 00    	mov    %ax,0x1104a6
  101a89:	c7 45 f8 60 f5 10 00 	movl   $0x10f560,-0x8(%ebp)
    asm volatile ("lidt (%0)" :: "r" (pd));
  101a90:	8b 45 f8             	mov    -0x8(%ebp),%eax
  101a93:	0f 01 18             	lidtl  (%eax)
}
  101a96:	90                   	nop

     lidt(&idt_pd);
    
}
  101a97:	90                   	nop
  101a98:	c9                   	leave  
  101a99:	c3                   	ret    

00101a9a <trapname>:

static const char *
trapname(int trapno) {
  101a9a:	f3 0f 1e fb          	endbr32 
  101a9e:	55                   	push   %ebp
  101a9f:	89 e5                	mov    %esp,%ebp
        "Alignment Check",
        "Machine-Check",
        "SIMD Floating-Point Exception"
    };

    if (trapno < sizeof(excnames)/sizeof(const char * const)) {
  101aa1:	8b 45 08             	mov    0x8(%ebp),%eax
  101aa4:	83 f8 13             	cmp    $0x13,%eax
  101aa7:	77 0c                	ja     101ab5 <trapname+0x1b>
        return excnames[trapno];
  101aa9:	8b 45 08             	mov    0x8(%ebp),%eax
  101aac:	8b 04 85 a0 3c 10 00 	mov    0x103ca0(,%eax,4),%eax
  101ab3:	eb 18                	jmp    101acd <trapname+0x33>
    }
    if (trapno >= IRQ_OFFSET && trapno < IRQ_OFFSET + 16) {
  101ab5:	83 7d 08 1f          	cmpl   $0x1f,0x8(%ebp)
  101ab9:	7e 0d                	jle    101ac8 <trapname+0x2e>
  101abb:	83 7d 08 2f          	cmpl   $0x2f,0x8(%ebp)
  101abf:	7f 07                	jg     101ac8 <trapname+0x2e>
        return "Hardware Interrupt";
  101ac1:	b8 4a 39 10 00       	mov    $0x10394a,%eax
  101ac6:	eb 05                	jmp    101acd <trapname+0x33>
    }
    return "(unknown trap)";
  101ac8:	b8 5d 39 10 00       	mov    $0x10395d,%eax
}
  101acd:	5d                   	pop    %ebp
  101ace:	c3                   	ret    

00101acf <trap_in_kernel>:

/* trap_in_kernel - test if trap happened in kernel */
bool
trap_in_kernel(struct trapframe *tf) {
  101acf:	f3 0f 1e fb          	endbr32 
  101ad3:	55                   	push   %ebp
  101ad4:	89 e5                	mov    %esp,%ebp
    return (tf->tf_cs == (uint16_t)KERNEL_CS);
  101ad6:	8b 45 08             	mov    0x8(%ebp),%eax
  101ad9:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101add:	83 f8 08             	cmp    $0x8,%eax
  101ae0:	0f 94 c0             	sete   %al
  101ae3:	0f b6 c0             	movzbl %al,%eax
}
  101ae6:	5d                   	pop    %ebp
  101ae7:	c3                   	ret    

00101ae8 <print_trapframe>:
    "TF", "IF", "DF", "OF", NULL, NULL, "NT", NULL,
    "RF", "VM", "AC", "VIF", "VIP", "ID", NULL, NULL,
};

void
print_trapframe(struct trapframe *tf) {
  101ae8:	f3 0f 1e fb          	endbr32 
  101aec:	55                   	push   %ebp
  101aed:	89 e5                	mov    %esp,%ebp
  101aef:	83 ec 28             	sub    $0x28,%esp
    cprintf("trapframe at %p\n", tf);
  101af2:	8b 45 08             	mov    0x8(%ebp),%eax
  101af5:	89 44 24 04          	mov    %eax,0x4(%esp)
  101af9:	c7 04 24 9e 39 10 00 	movl   $0x10399e,(%esp)
  101b00:	e8 7f e7 ff ff       	call   100284 <cprintf>
    print_regs(&tf->tf_regs);
  101b05:	8b 45 08             	mov    0x8(%ebp),%eax
  101b08:	89 04 24             	mov    %eax,(%esp)
  101b0b:	e8 8d 01 00 00       	call   101c9d <print_regs>
    cprintf("  ds   0x----%04x\n", tf->tf_ds);
  101b10:	8b 45 08             	mov    0x8(%ebp),%eax
  101b13:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
  101b17:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b1b:	c7 04 24 af 39 10 00 	movl   $0x1039af,(%esp)
  101b22:	e8 5d e7 ff ff       	call   100284 <cprintf>
    cprintf("  es   0x----%04x\n", tf->tf_es);
  101b27:	8b 45 08             	mov    0x8(%ebp),%eax
  101b2a:	0f b7 40 28          	movzwl 0x28(%eax),%eax
  101b2e:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b32:	c7 04 24 c2 39 10 00 	movl   $0x1039c2,(%esp)
  101b39:	e8 46 e7 ff ff       	call   100284 <cprintf>
    cprintf("  fs   0x----%04x\n", tf->tf_fs);
  101b3e:	8b 45 08             	mov    0x8(%ebp),%eax
  101b41:	0f b7 40 24          	movzwl 0x24(%eax),%eax
  101b45:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b49:	c7 04 24 d5 39 10 00 	movl   $0x1039d5,(%esp)
  101b50:	e8 2f e7 ff ff       	call   100284 <cprintf>
    cprintf("  gs   0x----%04x\n", tf->tf_gs);
  101b55:	8b 45 08             	mov    0x8(%ebp),%eax
  101b58:	0f b7 40 20          	movzwl 0x20(%eax),%eax
  101b5c:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b60:	c7 04 24 e8 39 10 00 	movl   $0x1039e8,(%esp)
  101b67:	e8 18 e7 ff ff       	call   100284 <cprintf>
    cprintf("  trap 0x%08x %s\n", tf->tf_trapno, trapname(tf->tf_trapno));
  101b6c:	8b 45 08             	mov    0x8(%ebp),%eax
  101b6f:	8b 40 30             	mov    0x30(%eax),%eax
  101b72:	89 04 24             	mov    %eax,(%esp)
  101b75:	e8 20 ff ff ff       	call   101a9a <trapname>
  101b7a:	8b 55 08             	mov    0x8(%ebp),%edx
  101b7d:	8b 52 30             	mov    0x30(%edx),%edx
  101b80:	89 44 24 08          	mov    %eax,0x8(%esp)
  101b84:	89 54 24 04          	mov    %edx,0x4(%esp)
  101b88:	c7 04 24 fb 39 10 00 	movl   $0x1039fb,(%esp)
  101b8f:	e8 f0 e6 ff ff       	call   100284 <cprintf>
    cprintf("  err  0x%08x\n", tf->tf_err);
  101b94:	8b 45 08             	mov    0x8(%ebp),%eax
  101b97:	8b 40 34             	mov    0x34(%eax),%eax
  101b9a:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b9e:	c7 04 24 0d 3a 10 00 	movl   $0x103a0d,(%esp)
  101ba5:	e8 da e6 ff ff       	call   100284 <cprintf>
    cprintf("  eip  0x%08x\n", tf->tf_eip);
  101baa:	8b 45 08             	mov    0x8(%ebp),%eax
  101bad:	8b 40 38             	mov    0x38(%eax),%eax
  101bb0:	89 44 24 04          	mov    %eax,0x4(%esp)
  101bb4:	c7 04 24 1c 3a 10 00 	movl   $0x103a1c,(%esp)
  101bbb:	e8 c4 e6 ff ff       	call   100284 <cprintf>
    cprintf("  cs   0x----%04x\n", tf->tf_cs);
  101bc0:	8b 45 08             	mov    0x8(%ebp),%eax
  101bc3:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101bc7:	89 44 24 04          	mov    %eax,0x4(%esp)
  101bcb:	c7 04 24 2b 3a 10 00 	movl   $0x103a2b,(%esp)
  101bd2:	e8 ad e6 ff ff       	call   100284 <cprintf>
    cprintf("  flag 0x%08x ", tf->tf_eflags);
  101bd7:	8b 45 08             	mov    0x8(%ebp),%eax
  101bda:	8b 40 40             	mov    0x40(%eax),%eax
  101bdd:	89 44 24 04          	mov    %eax,0x4(%esp)
  101be1:	c7 04 24 3e 3a 10 00 	movl   $0x103a3e,(%esp)
  101be8:	e8 97 e6 ff ff       	call   100284 <cprintf>

    int i, j;
    for (i = 0, j = 1; i < sizeof(IA32flags) / sizeof(IA32flags[0]); i ++, j <<= 1) {
  101bed:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  101bf4:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
  101bfb:	eb 3d                	jmp    101c3a <print_trapframe+0x152>
        if ((tf->tf_eflags & j) && IA32flags[i] != NULL) {
  101bfd:	8b 45 08             	mov    0x8(%ebp),%eax
  101c00:	8b 50 40             	mov    0x40(%eax),%edx
  101c03:	8b 45 f0             	mov    -0x10(%ebp),%eax
  101c06:	21 d0                	and    %edx,%eax
  101c08:	85 c0                	test   %eax,%eax
  101c0a:	74 28                	je     101c34 <print_trapframe+0x14c>
  101c0c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101c0f:	8b 04 85 80 f5 10 00 	mov    0x10f580(,%eax,4),%eax
  101c16:	85 c0                	test   %eax,%eax
  101c18:	74 1a                	je     101c34 <print_trapframe+0x14c>
            cprintf("%s,", IA32flags[i]);
  101c1a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101c1d:	8b 04 85 80 f5 10 00 	mov    0x10f580(,%eax,4),%eax
  101c24:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c28:	c7 04 24 4d 3a 10 00 	movl   $0x103a4d,(%esp)
  101c2f:	e8 50 e6 ff ff       	call   100284 <cprintf>
    for (i = 0, j = 1; i < sizeof(IA32flags) / sizeof(IA32flags[0]); i ++, j <<= 1) {
  101c34:	ff 45 f4             	incl   -0xc(%ebp)
  101c37:	d1 65 f0             	shll   -0x10(%ebp)
  101c3a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101c3d:	83 f8 17             	cmp    $0x17,%eax
  101c40:	76 bb                	jbe    101bfd <print_trapframe+0x115>
        }
    }
    cprintf("IOPL=%d\n", (tf->tf_eflags & FL_IOPL_MASK) >> 12);
  101c42:	8b 45 08             	mov    0x8(%ebp),%eax
  101c45:	8b 40 40             	mov    0x40(%eax),%eax
  101c48:	c1 e8 0c             	shr    $0xc,%eax
  101c4b:	83 e0 03             	and    $0x3,%eax
  101c4e:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c52:	c7 04 24 51 3a 10 00 	movl   $0x103a51,(%esp)
  101c59:	e8 26 e6 ff ff       	call   100284 <cprintf>

    if (!trap_in_kernel(tf)) {
  101c5e:	8b 45 08             	mov    0x8(%ebp),%eax
  101c61:	89 04 24             	mov    %eax,(%esp)
  101c64:	e8 66 fe ff ff       	call   101acf <trap_in_kernel>
  101c69:	85 c0                	test   %eax,%eax
  101c6b:	75 2d                	jne    101c9a <print_trapframe+0x1b2>
        cprintf("  esp  0x%08x\n", tf->tf_esp);
  101c6d:	8b 45 08             	mov    0x8(%ebp),%eax
  101c70:	8b 40 44             	mov    0x44(%eax),%eax
  101c73:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c77:	c7 04 24 5a 3a 10 00 	movl   $0x103a5a,(%esp)
  101c7e:	e8 01 e6 ff ff       	call   100284 <cprintf>
        cprintf("  ss   0x----%04x\n", tf->tf_ss);
  101c83:	8b 45 08             	mov    0x8(%ebp),%eax
  101c86:	0f b7 40 48          	movzwl 0x48(%eax),%eax
  101c8a:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c8e:	c7 04 24 69 3a 10 00 	movl   $0x103a69,(%esp)
  101c95:	e8 ea e5 ff ff       	call   100284 <cprintf>
    }
}
  101c9a:	90                   	nop
  101c9b:	c9                   	leave  
  101c9c:	c3                   	ret    

00101c9d <print_regs>:

void
print_regs(struct pushregs *regs) {
  101c9d:	f3 0f 1e fb          	endbr32 
  101ca1:	55                   	push   %ebp
  101ca2:	89 e5                	mov    %esp,%ebp
  101ca4:	83 ec 18             	sub    $0x18,%esp
    cprintf("  edi  0x%08x\n", regs->reg_edi);
  101ca7:	8b 45 08             	mov    0x8(%ebp),%eax
  101caa:	8b 00                	mov    (%eax),%eax
  101cac:	89 44 24 04          	mov    %eax,0x4(%esp)
  101cb0:	c7 04 24 7c 3a 10 00 	movl   $0x103a7c,(%esp)
  101cb7:	e8 c8 e5 ff ff       	call   100284 <cprintf>
    cprintf("  esi  0x%08x\n", regs->reg_esi);
  101cbc:	8b 45 08             	mov    0x8(%ebp),%eax
  101cbf:	8b 40 04             	mov    0x4(%eax),%eax
  101cc2:	89 44 24 04          	mov    %eax,0x4(%esp)
  101cc6:	c7 04 24 8b 3a 10 00 	movl   $0x103a8b,(%esp)
  101ccd:	e8 b2 e5 ff ff       	call   100284 <cprintf>
    cprintf("  ebp  0x%08x\n", regs->reg_ebp);
  101cd2:	8b 45 08             	mov    0x8(%ebp),%eax
  101cd5:	8b 40 08             	mov    0x8(%eax),%eax
  101cd8:	89 44 24 04          	mov    %eax,0x4(%esp)
  101cdc:	c7 04 24 9a 3a 10 00 	movl   $0x103a9a,(%esp)
  101ce3:	e8 9c e5 ff ff       	call   100284 <cprintf>
    cprintf("  oesp 0x%08x\n", regs->reg_oesp);
  101ce8:	8b 45 08             	mov    0x8(%ebp),%eax
  101ceb:	8b 40 0c             	mov    0xc(%eax),%eax
  101cee:	89 44 24 04          	mov    %eax,0x4(%esp)
  101cf2:	c7 04 24 a9 3a 10 00 	movl   $0x103aa9,(%esp)
  101cf9:	e8 86 e5 ff ff       	call   100284 <cprintf>
    cprintf("  ebx  0x%08x\n", regs->reg_ebx);
  101cfe:	8b 45 08             	mov    0x8(%ebp),%eax
  101d01:	8b 40 10             	mov    0x10(%eax),%eax
  101d04:	89 44 24 04          	mov    %eax,0x4(%esp)
  101d08:	c7 04 24 b8 3a 10 00 	movl   $0x103ab8,(%esp)
  101d0f:	e8 70 e5 ff ff       	call   100284 <cprintf>
    cprintf("  edx  0x%08x\n", regs->reg_edx);
  101d14:	8b 45 08             	mov    0x8(%ebp),%eax
  101d17:	8b 40 14             	mov    0x14(%eax),%eax
  101d1a:	89 44 24 04          	mov    %eax,0x4(%esp)
  101d1e:	c7 04 24 c7 3a 10 00 	movl   $0x103ac7,(%esp)
  101d25:	e8 5a e5 ff ff       	call   100284 <cprintf>
    cprintf("  ecx  0x%08x\n", regs->reg_ecx);
  101d2a:	8b 45 08             	mov    0x8(%ebp),%eax
  101d2d:	8b 40 18             	mov    0x18(%eax),%eax
  101d30:	89 44 24 04          	mov    %eax,0x4(%esp)
  101d34:	c7 04 24 d6 3a 10 00 	movl   $0x103ad6,(%esp)
  101d3b:	e8 44 e5 ff ff       	call   100284 <cprintf>
    cprintf("  eax  0x%08x\n", regs->reg_eax);
  101d40:	8b 45 08             	mov    0x8(%ebp),%eax
  101d43:	8b 40 1c             	mov    0x1c(%eax),%eax
  101d46:	89 44 24 04          	mov    %eax,0x4(%esp)
  101d4a:	c7 04 24 e5 3a 10 00 	movl   $0x103ae5,(%esp)
  101d51:	e8 2e e5 ff ff       	call   100284 <cprintf>
}
  101d56:	90                   	nop
  101d57:	c9                   	leave  
  101d58:	c3                   	ret    

00101d59 <trap_dispatch>:

/* trap_dispatch - dispatch based on what type of trap occurred */
static void
trap_dispatch(struct trapframe *tf) {
  101d59:	f3 0f 1e fb          	endbr32 
  101d5d:	55                   	push   %ebp
  101d5e:	89 e5                	mov    %esp,%ebp
  101d60:	83 ec 28             	sub    $0x28,%esp
    char c;

    switch (tf->tf_trapno) {
  101d63:	8b 45 08             	mov    0x8(%ebp),%eax
  101d66:	8b 40 30             	mov    0x30(%eax),%eax
  101d69:	83 f8 79             	cmp    $0x79,%eax
  101d6c:	0f 87 db 00 00 00    	ja     101e4d <trap_dispatch+0xf4>
  101d72:	83 f8 78             	cmp    $0x78,%eax
  101d75:	0f 83 b6 00 00 00    	jae    101e31 <trap_dispatch+0xd8>
  101d7b:	83 f8 2f             	cmp    $0x2f,%eax
  101d7e:	0f 87 c9 00 00 00    	ja     101e4d <trap_dispatch+0xf4>
  101d84:	83 f8 2e             	cmp    $0x2e,%eax
  101d87:	0f 83 f5 00 00 00    	jae    101e82 <trap_dispatch+0x129>
  101d8d:	83 f8 24             	cmp    $0x24,%eax
  101d90:	74 53                	je     101de5 <trap_dispatch+0x8c>
  101d92:	83 f8 24             	cmp    $0x24,%eax
  101d95:	0f 87 b2 00 00 00    	ja     101e4d <trap_dispatch+0xf4>
  101d9b:	83 f8 20             	cmp    $0x20,%eax
  101d9e:	74 0a                	je     101daa <trap_dispatch+0x51>
  101da0:	83 f8 21             	cmp    $0x21,%eax
  101da3:	74 66                	je     101e0b <trap_dispatch+0xb2>
  101da5:	e9 a3 00 00 00       	jmp    101e4d <trap_dispatch+0xf4>
        /* handle the timer interrupt */
        /* (1) After a timer interrupt, you should record this event using a global variable (increase it), such as ticks in kern/driver/clock.c
         * (2) Every TICK_NUM cycle, you can print some info using a funciton, such as print_ticks().
         * (3) Too Simple? Yes, I think so!
         */
        ticks++;
  101daa:	a1 08 09 11 00       	mov    0x110908,%eax
  101daf:	40                   	inc    %eax
  101db0:	a3 08 09 11 00       	mov    %eax,0x110908
        if(ticks % TICK_NUM == 0)
  101db5:	8b 0d 08 09 11 00    	mov    0x110908,%ecx
  101dbb:	ba d3 4d 62 10       	mov    $0x10624dd3,%edx
  101dc0:	89 c8                	mov    %ecx,%eax
  101dc2:	f7 e2                	mul    %edx
  101dc4:	89 d0                	mov    %edx,%eax
  101dc6:	c1 e8 05             	shr    $0x5,%eax
  101dc9:	69 c0 f4 01 00 00    	imul   $0x1f4,%eax,%eax
  101dcf:	29 c1                	sub    %eax,%ecx
  101dd1:	89 c8                	mov    %ecx,%eax
  101dd3:	85 c0                	test   %eax,%eax
  101dd5:	0f 85 aa 00 00 00    	jne    101e85 <trap_dispatch+0x12c>
        {
            print_ticks();
  101ddb:	e8 23 fb ff ff       	call   101903 <print_ticks>
        }
        break;
  101de0:	e9 a0 00 00 00       	jmp    101e85 <trap_dispatch+0x12c>
    case IRQ_OFFSET + IRQ_COM1:
        c = cons_getc();
  101de5:	e8 bf f8 ff ff       	call   1016a9 <cons_getc>
  101dea:	88 45 f7             	mov    %al,-0x9(%ebp)
        cprintf("serial [%03d] %c\n", c, c);
  101ded:	0f be 55 f7          	movsbl -0x9(%ebp),%edx
  101df1:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  101df5:	89 54 24 08          	mov    %edx,0x8(%esp)
  101df9:	89 44 24 04          	mov    %eax,0x4(%esp)
  101dfd:	c7 04 24 f4 3a 10 00 	movl   $0x103af4,(%esp)
  101e04:	e8 7b e4 ff ff       	call   100284 <cprintf>
        break;
  101e09:	eb 7b                	jmp    101e86 <trap_dispatch+0x12d>
    case IRQ_OFFSET + IRQ_KBD:
        c = cons_getc();
  101e0b:	e8 99 f8 ff ff       	call   1016a9 <cons_getc>
  101e10:	88 45 f7             	mov    %al,-0x9(%ebp)
        cprintf("kbd [%03d] %c\n", c, c);
  101e13:	0f be 55 f7          	movsbl -0x9(%ebp),%edx
  101e17:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  101e1b:	89 54 24 08          	mov    %edx,0x8(%esp)
  101e1f:	89 44 24 04          	mov    %eax,0x4(%esp)
  101e23:	c7 04 24 06 3b 10 00 	movl   $0x103b06,(%esp)
  101e2a:	e8 55 e4 ff ff       	call   100284 <cprintf>
        break;
  101e2f:	eb 55                	jmp    101e86 <trap_dispatch+0x12d>
    //LAB1 CHALLENGE 1 : YOUR CODE you should modify below codes.
    case T_SWITCH_TOU:
    case T_SWITCH_TOK:
        panic("T_SWITCH_** ??\n");
  101e31:	c7 44 24 08 15 3b 10 	movl   $0x103b15,0x8(%esp)
  101e38:	00 
  101e39:	c7 44 24 04 b2 00 00 	movl   $0xb2,0x4(%esp)
  101e40:	00 
  101e41:	c7 04 24 25 3b 10 00 	movl   $0x103b25,(%esp)
  101e48:	e8 a3 e5 ff ff       	call   1003f0 <__panic>
    case IRQ_OFFSET + IRQ_IDE2:
        /* do nothing */
        break;
    default:
        // in kernel, it must be a mistake
        if ((tf->tf_cs & 3) == 0) {
  101e4d:	8b 45 08             	mov    0x8(%ebp),%eax
  101e50:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101e54:	83 e0 03             	and    $0x3,%eax
  101e57:	85 c0                	test   %eax,%eax
  101e59:	75 2b                	jne    101e86 <trap_dispatch+0x12d>
            print_trapframe(tf);
  101e5b:	8b 45 08             	mov    0x8(%ebp),%eax
  101e5e:	89 04 24             	mov    %eax,(%esp)
  101e61:	e8 82 fc ff ff       	call   101ae8 <print_trapframe>
            panic("unexpected trap in kernel.\n");
  101e66:	c7 44 24 08 36 3b 10 	movl   $0x103b36,0x8(%esp)
  101e6d:	00 
  101e6e:	c7 44 24 04 bc 00 00 	movl   $0xbc,0x4(%esp)
  101e75:	00 
  101e76:	c7 04 24 25 3b 10 00 	movl   $0x103b25,(%esp)
  101e7d:	e8 6e e5 ff ff       	call   1003f0 <__panic>
        break;
  101e82:	90                   	nop
  101e83:	eb 01                	jmp    101e86 <trap_dispatch+0x12d>
        break;
  101e85:	90                   	nop
        }
    }
}
  101e86:	90                   	nop
  101e87:	c9                   	leave  
  101e88:	c3                   	ret    

00101e89 <trap>:
 * trap - handles or dispatches an exception/interrupt. if and when trap() returns,
 * the code in kern/trap/trapentry.S restores the old CPU state saved in the
 * trapframe and then uses the iret instruction to return from the exception.
 * */
void
trap(struct trapframe *tf) {
  101e89:	f3 0f 1e fb          	endbr32 
  101e8d:	55                   	push   %ebp
  101e8e:	89 e5                	mov    %esp,%ebp
  101e90:	83 ec 18             	sub    $0x18,%esp
    // dispatch based on what type of trap occurred
    trap_dispatch(tf);
  101e93:	8b 45 08             	mov    0x8(%ebp),%eax
  101e96:	89 04 24             	mov    %eax,(%esp)
  101e99:	e8 bb fe ff ff       	call   101d59 <trap_dispatch>
}
  101e9e:	90                   	nop
  101e9f:	c9                   	leave  
  101ea0:	c3                   	ret    

00101ea1 <vector0>:
# handler
.text
.globl __alltraps
.globl vector0
vector0:
  pushl $0
  101ea1:	6a 00                	push   $0x0
  pushl $0
  101ea3:	6a 00                	push   $0x0
  jmp __alltraps
  101ea5:	e9 69 0a 00 00       	jmp    102913 <__alltraps>

00101eaa <vector1>:
.globl vector1
vector1:
  pushl $0
  101eaa:	6a 00                	push   $0x0
  pushl $1
  101eac:	6a 01                	push   $0x1
  jmp __alltraps
  101eae:	e9 60 0a 00 00       	jmp    102913 <__alltraps>

00101eb3 <vector2>:
.globl vector2
vector2:
  pushl $0
  101eb3:	6a 00                	push   $0x0
  pushl $2
  101eb5:	6a 02                	push   $0x2
  jmp __alltraps
  101eb7:	e9 57 0a 00 00       	jmp    102913 <__alltraps>

00101ebc <vector3>:
.globl vector3
vector3:
  pushl $0
  101ebc:	6a 00                	push   $0x0
  pushl $3
  101ebe:	6a 03                	push   $0x3
  jmp __alltraps
  101ec0:	e9 4e 0a 00 00       	jmp    102913 <__alltraps>

00101ec5 <vector4>:
.globl vector4
vector4:
  pushl $0
  101ec5:	6a 00                	push   $0x0
  pushl $4
  101ec7:	6a 04                	push   $0x4
  jmp __alltraps
  101ec9:	e9 45 0a 00 00       	jmp    102913 <__alltraps>

00101ece <vector5>:
.globl vector5
vector5:
  pushl $0
  101ece:	6a 00                	push   $0x0
  pushl $5
  101ed0:	6a 05                	push   $0x5
  jmp __alltraps
  101ed2:	e9 3c 0a 00 00       	jmp    102913 <__alltraps>

00101ed7 <vector6>:
.globl vector6
vector6:
  pushl $0
  101ed7:	6a 00                	push   $0x0
  pushl $6
  101ed9:	6a 06                	push   $0x6
  jmp __alltraps
  101edb:	e9 33 0a 00 00       	jmp    102913 <__alltraps>

00101ee0 <vector7>:
.globl vector7
vector7:
  pushl $0
  101ee0:	6a 00                	push   $0x0
  pushl $7
  101ee2:	6a 07                	push   $0x7
  jmp __alltraps
  101ee4:	e9 2a 0a 00 00       	jmp    102913 <__alltraps>

00101ee9 <vector8>:
.globl vector8
vector8:
  pushl $8
  101ee9:	6a 08                	push   $0x8
  jmp __alltraps
  101eeb:	e9 23 0a 00 00       	jmp    102913 <__alltraps>

00101ef0 <vector9>:
.globl vector9
vector9:
  pushl $0
  101ef0:	6a 00                	push   $0x0
  pushl $9
  101ef2:	6a 09                	push   $0x9
  jmp __alltraps
  101ef4:	e9 1a 0a 00 00       	jmp    102913 <__alltraps>

00101ef9 <vector10>:
.globl vector10
vector10:
  pushl $10
  101ef9:	6a 0a                	push   $0xa
  jmp __alltraps
  101efb:	e9 13 0a 00 00       	jmp    102913 <__alltraps>

00101f00 <vector11>:
.globl vector11
vector11:
  pushl $11
  101f00:	6a 0b                	push   $0xb
  jmp __alltraps
  101f02:	e9 0c 0a 00 00       	jmp    102913 <__alltraps>

00101f07 <vector12>:
.globl vector12
vector12:
  pushl $12
  101f07:	6a 0c                	push   $0xc
  jmp __alltraps
  101f09:	e9 05 0a 00 00       	jmp    102913 <__alltraps>

00101f0e <vector13>:
.globl vector13
vector13:
  pushl $13
  101f0e:	6a 0d                	push   $0xd
  jmp __alltraps
  101f10:	e9 fe 09 00 00       	jmp    102913 <__alltraps>

00101f15 <vector14>:
.globl vector14
vector14:
  pushl $14
  101f15:	6a 0e                	push   $0xe
  jmp __alltraps
  101f17:	e9 f7 09 00 00       	jmp    102913 <__alltraps>

00101f1c <vector15>:
.globl vector15
vector15:
  pushl $0
  101f1c:	6a 00                	push   $0x0
  pushl $15
  101f1e:	6a 0f                	push   $0xf
  jmp __alltraps
  101f20:	e9 ee 09 00 00       	jmp    102913 <__alltraps>

00101f25 <vector16>:
.globl vector16
vector16:
  pushl $0
  101f25:	6a 00                	push   $0x0
  pushl $16
  101f27:	6a 10                	push   $0x10
  jmp __alltraps
  101f29:	e9 e5 09 00 00       	jmp    102913 <__alltraps>

00101f2e <vector17>:
.globl vector17
vector17:
  pushl $17
  101f2e:	6a 11                	push   $0x11
  jmp __alltraps
  101f30:	e9 de 09 00 00       	jmp    102913 <__alltraps>

00101f35 <vector18>:
.globl vector18
vector18:
  pushl $0
  101f35:	6a 00                	push   $0x0
  pushl $18
  101f37:	6a 12                	push   $0x12
  jmp __alltraps
  101f39:	e9 d5 09 00 00       	jmp    102913 <__alltraps>

00101f3e <vector19>:
.globl vector19
vector19:
  pushl $0
  101f3e:	6a 00                	push   $0x0
  pushl $19
  101f40:	6a 13                	push   $0x13
  jmp __alltraps
  101f42:	e9 cc 09 00 00       	jmp    102913 <__alltraps>

00101f47 <vector20>:
.globl vector20
vector20:
  pushl $0
  101f47:	6a 00                	push   $0x0
  pushl $20
  101f49:	6a 14                	push   $0x14
  jmp __alltraps
  101f4b:	e9 c3 09 00 00       	jmp    102913 <__alltraps>

00101f50 <vector21>:
.globl vector21
vector21:
  pushl $0
  101f50:	6a 00                	push   $0x0
  pushl $21
  101f52:	6a 15                	push   $0x15
  jmp __alltraps
  101f54:	e9 ba 09 00 00       	jmp    102913 <__alltraps>

00101f59 <vector22>:
.globl vector22
vector22:
  pushl $0
  101f59:	6a 00                	push   $0x0
  pushl $22
  101f5b:	6a 16                	push   $0x16
  jmp __alltraps
  101f5d:	e9 b1 09 00 00       	jmp    102913 <__alltraps>

00101f62 <vector23>:
.globl vector23
vector23:
  pushl $0
  101f62:	6a 00                	push   $0x0
  pushl $23
  101f64:	6a 17                	push   $0x17
  jmp __alltraps
  101f66:	e9 a8 09 00 00       	jmp    102913 <__alltraps>

00101f6b <vector24>:
.globl vector24
vector24:
  pushl $0
  101f6b:	6a 00                	push   $0x0
  pushl $24
  101f6d:	6a 18                	push   $0x18
  jmp __alltraps
  101f6f:	e9 9f 09 00 00       	jmp    102913 <__alltraps>

00101f74 <vector25>:
.globl vector25
vector25:
  pushl $0
  101f74:	6a 00                	push   $0x0
  pushl $25
  101f76:	6a 19                	push   $0x19
  jmp __alltraps
  101f78:	e9 96 09 00 00       	jmp    102913 <__alltraps>

00101f7d <vector26>:
.globl vector26
vector26:
  pushl $0
  101f7d:	6a 00                	push   $0x0
  pushl $26
  101f7f:	6a 1a                	push   $0x1a
  jmp __alltraps
  101f81:	e9 8d 09 00 00       	jmp    102913 <__alltraps>

00101f86 <vector27>:
.globl vector27
vector27:
  pushl $0
  101f86:	6a 00                	push   $0x0
  pushl $27
  101f88:	6a 1b                	push   $0x1b
  jmp __alltraps
  101f8a:	e9 84 09 00 00       	jmp    102913 <__alltraps>

00101f8f <vector28>:
.globl vector28
vector28:
  pushl $0
  101f8f:	6a 00                	push   $0x0
  pushl $28
  101f91:	6a 1c                	push   $0x1c
  jmp __alltraps
  101f93:	e9 7b 09 00 00       	jmp    102913 <__alltraps>

00101f98 <vector29>:
.globl vector29
vector29:
  pushl $0
  101f98:	6a 00                	push   $0x0
  pushl $29
  101f9a:	6a 1d                	push   $0x1d
  jmp __alltraps
  101f9c:	e9 72 09 00 00       	jmp    102913 <__alltraps>

00101fa1 <vector30>:
.globl vector30
vector30:
  pushl $0
  101fa1:	6a 00                	push   $0x0
  pushl $30
  101fa3:	6a 1e                	push   $0x1e
  jmp __alltraps
  101fa5:	e9 69 09 00 00       	jmp    102913 <__alltraps>

00101faa <vector31>:
.globl vector31
vector31:
  pushl $0
  101faa:	6a 00                	push   $0x0
  pushl $31
  101fac:	6a 1f                	push   $0x1f
  jmp __alltraps
  101fae:	e9 60 09 00 00       	jmp    102913 <__alltraps>

00101fb3 <vector32>:
.globl vector32
vector32:
  pushl $0
  101fb3:	6a 00                	push   $0x0
  pushl $32
  101fb5:	6a 20                	push   $0x20
  jmp __alltraps
  101fb7:	e9 57 09 00 00       	jmp    102913 <__alltraps>

00101fbc <vector33>:
.globl vector33
vector33:
  pushl $0
  101fbc:	6a 00                	push   $0x0
  pushl $33
  101fbe:	6a 21                	push   $0x21
  jmp __alltraps
  101fc0:	e9 4e 09 00 00       	jmp    102913 <__alltraps>

00101fc5 <vector34>:
.globl vector34
vector34:
  pushl $0
  101fc5:	6a 00                	push   $0x0
  pushl $34
  101fc7:	6a 22                	push   $0x22
  jmp __alltraps
  101fc9:	e9 45 09 00 00       	jmp    102913 <__alltraps>

00101fce <vector35>:
.globl vector35
vector35:
  pushl $0
  101fce:	6a 00                	push   $0x0
  pushl $35
  101fd0:	6a 23                	push   $0x23
  jmp __alltraps
  101fd2:	e9 3c 09 00 00       	jmp    102913 <__alltraps>

00101fd7 <vector36>:
.globl vector36
vector36:
  pushl $0
  101fd7:	6a 00                	push   $0x0
  pushl $36
  101fd9:	6a 24                	push   $0x24
  jmp __alltraps
  101fdb:	e9 33 09 00 00       	jmp    102913 <__alltraps>

00101fe0 <vector37>:
.globl vector37
vector37:
  pushl $0
  101fe0:	6a 00                	push   $0x0
  pushl $37
  101fe2:	6a 25                	push   $0x25
  jmp __alltraps
  101fe4:	e9 2a 09 00 00       	jmp    102913 <__alltraps>

00101fe9 <vector38>:
.globl vector38
vector38:
  pushl $0
  101fe9:	6a 00                	push   $0x0
  pushl $38
  101feb:	6a 26                	push   $0x26
  jmp __alltraps
  101fed:	e9 21 09 00 00       	jmp    102913 <__alltraps>

00101ff2 <vector39>:
.globl vector39
vector39:
  pushl $0
  101ff2:	6a 00                	push   $0x0
  pushl $39
  101ff4:	6a 27                	push   $0x27
  jmp __alltraps
  101ff6:	e9 18 09 00 00       	jmp    102913 <__alltraps>

00101ffb <vector40>:
.globl vector40
vector40:
  pushl $0
  101ffb:	6a 00                	push   $0x0
  pushl $40
  101ffd:	6a 28                	push   $0x28
  jmp __alltraps
  101fff:	e9 0f 09 00 00       	jmp    102913 <__alltraps>

00102004 <vector41>:
.globl vector41
vector41:
  pushl $0
  102004:	6a 00                	push   $0x0
  pushl $41
  102006:	6a 29                	push   $0x29
  jmp __alltraps
  102008:	e9 06 09 00 00       	jmp    102913 <__alltraps>

0010200d <vector42>:
.globl vector42
vector42:
  pushl $0
  10200d:	6a 00                	push   $0x0
  pushl $42
  10200f:	6a 2a                	push   $0x2a
  jmp __alltraps
  102011:	e9 fd 08 00 00       	jmp    102913 <__alltraps>

00102016 <vector43>:
.globl vector43
vector43:
  pushl $0
  102016:	6a 00                	push   $0x0
  pushl $43
  102018:	6a 2b                	push   $0x2b
  jmp __alltraps
  10201a:	e9 f4 08 00 00       	jmp    102913 <__alltraps>

0010201f <vector44>:
.globl vector44
vector44:
  pushl $0
  10201f:	6a 00                	push   $0x0
  pushl $44
  102021:	6a 2c                	push   $0x2c
  jmp __alltraps
  102023:	e9 eb 08 00 00       	jmp    102913 <__alltraps>

00102028 <vector45>:
.globl vector45
vector45:
  pushl $0
  102028:	6a 00                	push   $0x0
  pushl $45
  10202a:	6a 2d                	push   $0x2d
  jmp __alltraps
  10202c:	e9 e2 08 00 00       	jmp    102913 <__alltraps>

00102031 <vector46>:
.globl vector46
vector46:
  pushl $0
  102031:	6a 00                	push   $0x0
  pushl $46
  102033:	6a 2e                	push   $0x2e
  jmp __alltraps
  102035:	e9 d9 08 00 00       	jmp    102913 <__alltraps>

0010203a <vector47>:
.globl vector47
vector47:
  pushl $0
  10203a:	6a 00                	push   $0x0
  pushl $47
  10203c:	6a 2f                	push   $0x2f
  jmp __alltraps
  10203e:	e9 d0 08 00 00       	jmp    102913 <__alltraps>

00102043 <vector48>:
.globl vector48
vector48:
  pushl $0
  102043:	6a 00                	push   $0x0
  pushl $48
  102045:	6a 30                	push   $0x30
  jmp __alltraps
  102047:	e9 c7 08 00 00       	jmp    102913 <__alltraps>

0010204c <vector49>:
.globl vector49
vector49:
  pushl $0
  10204c:	6a 00                	push   $0x0
  pushl $49
  10204e:	6a 31                	push   $0x31
  jmp __alltraps
  102050:	e9 be 08 00 00       	jmp    102913 <__alltraps>

00102055 <vector50>:
.globl vector50
vector50:
  pushl $0
  102055:	6a 00                	push   $0x0
  pushl $50
  102057:	6a 32                	push   $0x32
  jmp __alltraps
  102059:	e9 b5 08 00 00       	jmp    102913 <__alltraps>

0010205e <vector51>:
.globl vector51
vector51:
  pushl $0
  10205e:	6a 00                	push   $0x0
  pushl $51
  102060:	6a 33                	push   $0x33
  jmp __alltraps
  102062:	e9 ac 08 00 00       	jmp    102913 <__alltraps>

00102067 <vector52>:
.globl vector52
vector52:
  pushl $0
  102067:	6a 00                	push   $0x0
  pushl $52
  102069:	6a 34                	push   $0x34
  jmp __alltraps
  10206b:	e9 a3 08 00 00       	jmp    102913 <__alltraps>

00102070 <vector53>:
.globl vector53
vector53:
  pushl $0
  102070:	6a 00                	push   $0x0
  pushl $53
  102072:	6a 35                	push   $0x35
  jmp __alltraps
  102074:	e9 9a 08 00 00       	jmp    102913 <__alltraps>

00102079 <vector54>:
.globl vector54
vector54:
  pushl $0
  102079:	6a 00                	push   $0x0
  pushl $54
  10207b:	6a 36                	push   $0x36
  jmp __alltraps
  10207d:	e9 91 08 00 00       	jmp    102913 <__alltraps>

00102082 <vector55>:
.globl vector55
vector55:
  pushl $0
  102082:	6a 00                	push   $0x0
  pushl $55
  102084:	6a 37                	push   $0x37
  jmp __alltraps
  102086:	e9 88 08 00 00       	jmp    102913 <__alltraps>

0010208b <vector56>:
.globl vector56
vector56:
  pushl $0
  10208b:	6a 00                	push   $0x0
  pushl $56
  10208d:	6a 38                	push   $0x38
  jmp __alltraps
  10208f:	e9 7f 08 00 00       	jmp    102913 <__alltraps>

00102094 <vector57>:
.globl vector57
vector57:
  pushl $0
  102094:	6a 00                	push   $0x0
  pushl $57
  102096:	6a 39                	push   $0x39
  jmp __alltraps
  102098:	e9 76 08 00 00       	jmp    102913 <__alltraps>

0010209d <vector58>:
.globl vector58
vector58:
  pushl $0
  10209d:	6a 00                	push   $0x0
  pushl $58
  10209f:	6a 3a                	push   $0x3a
  jmp __alltraps
  1020a1:	e9 6d 08 00 00       	jmp    102913 <__alltraps>

001020a6 <vector59>:
.globl vector59
vector59:
  pushl $0
  1020a6:	6a 00                	push   $0x0
  pushl $59
  1020a8:	6a 3b                	push   $0x3b
  jmp __alltraps
  1020aa:	e9 64 08 00 00       	jmp    102913 <__alltraps>

001020af <vector60>:
.globl vector60
vector60:
  pushl $0
  1020af:	6a 00                	push   $0x0
  pushl $60
  1020b1:	6a 3c                	push   $0x3c
  jmp __alltraps
  1020b3:	e9 5b 08 00 00       	jmp    102913 <__alltraps>

001020b8 <vector61>:
.globl vector61
vector61:
  pushl $0
  1020b8:	6a 00                	push   $0x0
  pushl $61
  1020ba:	6a 3d                	push   $0x3d
  jmp __alltraps
  1020bc:	e9 52 08 00 00       	jmp    102913 <__alltraps>

001020c1 <vector62>:
.globl vector62
vector62:
  pushl $0
  1020c1:	6a 00                	push   $0x0
  pushl $62
  1020c3:	6a 3e                	push   $0x3e
  jmp __alltraps
  1020c5:	e9 49 08 00 00       	jmp    102913 <__alltraps>

001020ca <vector63>:
.globl vector63
vector63:
  pushl $0
  1020ca:	6a 00                	push   $0x0
  pushl $63
  1020cc:	6a 3f                	push   $0x3f
  jmp __alltraps
  1020ce:	e9 40 08 00 00       	jmp    102913 <__alltraps>

001020d3 <vector64>:
.globl vector64
vector64:
  pushl $0
  1020d3:	6a 00                	push   $0x0
  pushl $64
  1020d5:	6a 40                	push   $0x40
  jmp __alltraps
  1020d7:	e9 37 08 00 00       	jmp    102913 <__alltraps>

001020dc <vector65>:
.globl vector65
vector65:
  pushl $0
  1020dc:	6a 00                	push   $0x0
  pushl $65
  1020de:	6a 41                	push   $0x41
  jmp __alltraps
  1020e0:	e9 2e 08 00 00       	jmp    102913 <__alltraps>

001020e5 <vector66>:
.globl vector66
vector66:
  pushl $0
  1020e5:	6a 00                	push   $0x0
  pushl $66
  1020e7:	6a 42                	push   $0x42
  jmp __alltraps
  1020e9:	e9 25 08 00 00       	jmp    102913 <__alltraps>

001020ee <vector67>:
.globl vector67
vector67:
  pushl $0
  1020ee:	6a 00                	push   $0x0
  pushl $67
  1020f0:	6a 43                	push   $0x43
  jmp __alltraps
  1020f2:	e9 1c 08 00 00       	jmp    102913 <__alltraps>

001020f7 <vector68>:
.globl vector68
vector68:
  pushl $0
  1020f7:	6a 00                	push   $0x0
  pushl $68
  1020f9:	6a 44                	push   $0x44
  jmp __alltraps
  1020fb:	e9 13 08 00 00       	jmp    102913 <__alltraps>

00102100 <vector69>:
.globl vector69
vector69:
  pushl $0
  102100:	6a 00                	push   $0x0
  pushl $69
  102102:	6a 45                	push   $0x45
  jmp __alltraps
  102104:	e9 0a 08 00 00       	jmp    102913 <__alltraps>

00102109 <vector70>:
.globl vector70
vector70:
  pushl $0
  102109:	6a 00                	push   $0x0
  pushl $70
  10210b:	6a 46                	push   $0x46
  jmp __alltraps
  10210d:	e9 01 08 00 00       	jmp    102913 <__alltraps>

00102112 <vector71>:
.globl vector71
vector71:
  pushl $0
  102112:	6a 00                	push   $0x0
  pushl $71
  102114:	6a 47                	push   $0x47
  jmp __alltraps
  102116:	e9 f8 07 00 00       	jmp    102913 <__alltraps>

0010211b <vector72>:
.globl vector72
vector72:
  pushl $0
  10211b:	6a 00                	push   $0x0
  pushl $72
  10211d:	6a 48                	push   $0x48
  jmp __alltraps
  10211f:	e9 ef 07 00 00       	jmp    102913 <__alltraps>

00102124 <vector73>:
.globl vector73
vector73:
  pushl $0
  102124:	6a 00                	push   $0x0
  pushl $73
  102126:	6a 49                	push   $0x49
  jmp __alltraps
  102128:	e9 e6 07 00 00       	jmp    102913 <__alltraps>

0010212d <vector74>:
.globl vector74
vector74:
  pushl $0
  10212d:	6a 00                	push   $0x0
  pushl $74
  10212f:	6a 4a                	push   $0x4a
  jmp __alltraps
  102131:	e9 dd 07 00 00       	jmp    102913 <__alltraps>

00102136 <vector75>:
.globl vector75
vector75:
  pushl $0
  102136:	6a 00                	push   $0x0
  pushl $75
  102138:	6a 4b                	push   $0x4b
  jmp __alltraps
  10213a:	e9 d4 07 00 00       	jmp    102913 <__alltraps>

0010213f <vector76>:
.globl vector76
vector76:
  pushl $0
  10213f:	6a 00                	push   $0x0
  pushl $76
  102141:	6a 4c                	push   $0x4c
  jmp __alltraps
  102143:	e9 cb 07 00 00       	jmp    102913 <__alltraps>

00102148 <vector77>:
.globl vector77
vector77:
  pushl $0
  102148:	6a 00                	push   $0x0
  pushl $77
  10214a:	6a 4d                	push   $0x4d
  jmp __alltraps
  10214c:	e9 c2 07 00 00       	jmp    102913 <__alltraps>

00102151 <vector78>:
.globl vector78
vector78:
  pushl $0
  102151:	6a 00                	push   $0x0
  pushl $78
  102153:	6a 4e                	push   $0x4e
  jmp __alltraps
  102155:	e9 b9 07 00 00       	jmp    102913 <__alltraps>

0010215a <vector79>:
.globl vector79
vector79:
  pushl $0
  10215a:	6a 00                	push   $0x0
  pushl $79
  10215c:	6a 4f                	push   $0x4f
  jmp __alltraps
  10215e:	e9 b0 07 00 00       	jmp    102913 <__alltraps>

00102163 <vector80>:
.globl vector80
vector80:
  pushl $0
  102163:	6a 00                	push   $0x0
  pushl $80
  102165:	6a 50                	push   $0x50
  jmp __alltraps
  102167:	e9 a7 07 00 00       	jmp    102913 <__alltraps>

0010216c <vector81>:
.globl vector81
vector81:
  pushl $0
  10216c:	6a 00                	push   $0x0
  pushl $81
  10216e:	6a 51                	push   $0x51
  jmp __alltraps
  102170:	e9 9e 07 00 00       	jmp    102913 <__alltraps>

00102175 <vector82>:
.globl vector82
vector82:
  pushl $0
  102175:	6a 00                	push   $0x0
  pushl $82
  102177:	6a 52                	push   $0x52
  jmp __alltraps
  102179:	e9 95 07 00 00       	jmp    102913 <__alltraps>

0010217e <vector83>:
.globl vector83
vector83:
  pushl $0
  10217e:	6a 00                	push   $0x0
  pushl $83
  102180:	6a 53                	push   $0x53
  jmp __alltraps
  102182:	e9 8c 07 00 00       	jmp    102913 <__alltraps>

00102187 <vector84>:
.globl vector84
vector84:
  pushl $0
  102187:	6a 00                	push   $0x0
  pushl $84
  102189:	6a 54                	push   $0x54
  jmp __alltraps
  10218b:	e9 83 07 00 00       	jmp    102913 <__alltraps>

00102190 <vector85>:
.globl vector85
vector85:
  pushl $0
  102190:	6a 00                	push   $0x0
  pushl $85
  102192:	6a 55                	push   $0x55
  jmp __alltraps
  102194:	e9 7a 07 00 00       	jmp    102913 <__alltraps>

00102199 <vector86>:
.globl vector86
vector86:
  pushl $0
  102199:	6a 00                	push   $0x0
  pushl $86
  10219b:	6a 56                	push   $0x56
  jmp __alltraps
  10219d:	e9 71 07 00 00       	jmp    102913 <__alltraps>

001021a2 <vector87>:
.globl vector87
vector87:
  pushl $0
  1021a2:	6a 00                	push   $0x0
  pushl $87
  1021a4:	6a 57                	push   $0x57
  jmp __alltraps
  1021a6:	e9 68 07 00 00       	jmp    102913 <__alltraps>

001021ab <vector88>:
.globl vector88
vector88:
  pushl $0
  1021ab:	6a 00                	push   $0x0
  pushl $88
  1021ad:	6a 58                	push   $0x58
  jmp __alltraps
  1021af:	e9 5f 07 00 00       	jmp    102913 <__alltraps>

001021b4 <vector89>:
.globl vector89
vector89:
  pushl $0
  1021b4:	6a 00                	push   $0x0
  pushl $89
  1021b6:	6a 59                	push   $0x59
  jmp __alltraps
  1021b8:	e9 56 07 00 00       	jmp    102913 <__alltraps>

001021bd <vector90>:
.globl vector90
vector90:
  pushl $0
  1021bd:	6a 00                	push   $0x0
  pushl $90
  1021bf:	6a 5a                	push   $0x5a
  jmp __alltraps
  1021c1:	e9 4d 07 00 00       	jmp    102913 <__alltraps>

001021c6 <vector91>:
.globl vector91
vector91:
  pushl $0
  1021c6:	6a 00                	push   $0x0
  pushl $91
  1021c8:	6a 5b                	push   $0x5b
  jmp __alltraps
  1021ca:	e9 44 07 00 00       	jmp    102913 <__alltraps>

001021cf <vector92>:
.globl vector92
vector92:
  pushl $0
  1021cf:	6a 00                	push   $0x0
  pushl $92
  1021d1:	6a 5c                	push   $0x5c
  jmp __alltraps
  1021d3:	e9 3b 07 00 00       	jmp    102913 <__alltraps>

001021d8 <vector93>:
.globl vector93
vector93:
  pushl $0
  1021d8:	6a 00                	push   $0x0
  pushl $93
  1021da:	6a 5d                	push   $0x5d
  jmp __alltraps
  1021dc:	e9 32 07 00 00       	jmp    102913 <__alltraps>

001021e1 <vector94>:
.globl vector94
vector94:
  pushl $0
  1021e1:	6a 00                	push   $0x0
  pushl $94
  1021e3:	6a 5e                	push   $0x5e
  jmp __alltraps
  1021e5:	e9 29 07 00 00       	jmp    102913 <__alltraps>

001021ea <vector95>:
.globl vector95
vector95:
  pushl $0
  1021ea:	6a 00                	push   $0x0
  pushl $95
  1021ec:	6a 5f                	push   $0x5f
  jmp __alltraps
  1021ee:	e9 20 07 00 00       	jmp    102913 <__alltraps>

001021f3 <vector96>:
.globl vector96
vector96:
  pushl $0
  1021f3:	6a 00                	push   $0x0
  pushl $96
  1021f5:	6a 60                	push   $0x60
  jmp __alltraps
  1021f7:	e9 17 07 00 00       	jmp    102913 <__alltraps>

001021fc <vector97>:
.globl vector97
vector97:
  pushl $0
  1021fc:	6a 00                	push   $0x0
  pushl $97
  1021fe:	6a 61                	push   $0x61
  jmp __alltraps
  102200:	e9 0e 07 00 00       	jmp    102913 <__alltraps>

00102205 <vector98>:
.globl vector98
vector98:
  pushl $0
  102205:	6a 00                	push   $0x0
  pushl $98
  102207:	6a 62                	push   $0x62
  jmp __alltraps
  102209:	e9 05 07 00 00       	jmp    102913 <__alltraps>

0010220e <vector99>:
.globl vector99
vector99:
  pushl $0
  10220e:	6a 00                	push   $0x0
  pushl $99
  102210:	6a 63                	push   $0x63
  jmp __alltraps
  102212:	e9 fc 06 00 00       	jmp    102913 <__alltraps>

00102217 <vector100>:
.globl vector100
vector100:
  pushl $0
  102217:	6a 00                	push   $0x0
  pushl $100
  102219:	6a 64                	push   $0x64
  jmp __alltraps
  10221b:	e9 f3 06 00 00       	jmp    102913 <__alltraps>

00102220 <vector101>:
.globl vector101
vector101:
  pushl $0
  102220:	6a 00                	push   $0x0
  pushl $101
  102222:	6a 65                	push   $0x65
  jmp __alltraps
  102224:	e9 ea 06 00 00       	jmp    102913 <__alltraps>

00102229 <vector102>:
.globl vector102
vector102:
  pushl $0
  102229:	6a 00                	push   $0x0
  pushl $102
  10222b:	6a 66                	push   $0x66
  jmp __alltraps
  10222d:	e9 e1 06 00 00       	jmp    102913 <__alltraps>

00102232 <vector103>:
.globl vector103
vector103:
  pushl $0
  102232:	6a 00                	push   $0x0
  pushl $103
  102234:	6a 67                	push   $0x67
  jmp __alltraps
  102236:	e9 d8 06 00 00       	jmp    102913 <__alltraps>

0010223b <vector104>:
.globl vector104
vector104:
  pushl $0
  10223b:	6a 00                	push   $0x0
  pushl $104
  10223d:	6a 68                	push   $0x68
  jmp __alltraps
  10223f:	e9 cf 06 00 00       	jmp    102913 <__alltraps>

00102244 <vector105>:
.globl vector105
vector105:
  pushl $0
  102244:	6a 00                	push   $0x0
  pushl $105
  102246:	6a 69                	push   $0x69
  jmp __alltraps
  102248:	e9 c6 06 00 00       	jmp    102913 <__alltraps>

0010224d <vector106>:
.globl vector106
vector106:
  pushl $0
  10224d:	6a 00                	push   $0x0
  pushl $106
  10224f:	6a 6a                	push   $0x6a
  jmp __alltraps
  102251:	e9 bd 06 00 00       	jmp    102913 <__alltraps>

00102256 <vector107>:
.globl vector107
vector107:
  pushl $0
  102256:	6a 00                	push   $0x0
  pushl $107
  102258:	6a 6b                	push   $0x6b
  jmp __alltraps
  10225a:	e9 b4 06 00 00       	jmp    102913 <__alltraps>

0010225f <vector108>:
.globl vector108
vector108:
  pushl $0
  10225f:	6a 00                	push   $0x0
  pushl $108
  102261:	6a 6c                	push   $0x6c
  jmp __alltraps
  102263:	e9 ab 06 00 00       	jmp    102913 <__alltraps>

00102268 <vector109>:
.globl vector109
vector109:
  pushl $0
  102268:	6a 00                	push   $0x0
  pushl $109
  10226a:	6a 6d                	push   $0x6d
  jmp __alltraps
  10226c:	e9 a2 06 00 00       	jmp    102913 <__alltraps>

00102271 <vector110>:
.globl vector110
vector110:
  pushl $0
  102271:	6a 00                	push   $0x0
  pushl $110
  102273:	6a 6e                	push   $0x6e
  jmp __alltraps
  102275:	e9 99 06 00 00       	jmp    102913 <__alltraps>

0010227a <vector111>:
.globl vector111
vector111:
  pushl $0
  10227a:	6a 00                	push   $0x0
  pushl $111
  10227c:	6a 6f                	push   $0x6f
  jmp __alltraps
  10227e:	e9 90 06 00 00       	jmp    102913 <__alltraps>

00102283 <vector112>:
.globl vector112
vector112:
  pushl $0
  102283:	6a 00                	push   $0x0
  pushl $112
  102285:	6a 70                	push   $0x70
  jmp __alltraps
  102287:	e9 87 06 00 00       	jmp    102913 <__alltraps>

0010228c <vector113>:
.globl vector113
vector113:
  pushl $0
  10228c:	6a 00                	push   $0x0
  pushl $113
  10228e:	6a 71                	push   $0x71
  jmp __alltraps
  102290:	e9 7e 06 00 00       	jmp    102913 <__alltraps>

00102295 <vector114>:
.globl vector114
vector114:
  pushl $0
  102295:	6a 00                	push   $0x0
  pushl $114
  102297:	6a 72                	push   $0x72
  jmp __alltraps
  102299:	e9 75 06 00 00       	jmp    102913 <__alltraps>

0010229e <vector115>:
.globl vector115
vector115:
  pushl $0
  10229e:	6a 00                	push   $0x0
  pushl $115
  1022a0:	6a 73                	push   $0x73
  jmp __alltraps
  1022a2:	e9 6c 06 00 00       	jmp    102913 <__alltraps>

001022a7 <vector116>:
.globl vector116
vector116:
  pushl $0
  1022a7:	6a 00                	push   $0x0
  pushl $116
  1022a9:	6a 74                	push   $0x74
  jmp __alltraps
  1022ab:	e9 63 06 00 00       	jmp    102913 <__alltraps>

001022b0 <vector117>:
.globl vector117
vector117:
  pushl $0
  1022b0:	6a 00                	push   $0x0
  pushl $117
  1022b2:	6a 75                	push   $0x75
  jmp __alltraps
  1022b4:	e9 5a 06 00 00       	jmp    102913 <__alltraps>

001022b9 <vector118>:
.globl vector118
vector118:
  pushl $0
  1022b9:	6a 00                	push   $0x0
  pushl $118
  1022bb:	6a 76                	push   $0x76
  jmp __alltraps
  1022bd:	e9 51 06 00 00       	jmp    102913 <__alltraps>

001022c2 <vector119>:
.globl vector119
vector119:
  pushl $0
  1022c2:	6a 00                	push   $0x0
  pushl $119
  1022c4:	6a 77                	push   $0x77
  jmp __alltraps
  1022c6:	e9 48 06 00 00       	jmp    102913 <__alltraps>

001022cb <vector120>:
.globl vector120
vector120:
  pushl $0
  1022cb:	6a 00                	push   $0x0
  pushl $120
  1022cd:	6a 78                	push   $0x78
  jmp __alltraps
  1022cf:	e9 3f 06 00 00       	jmp    102913 <__alltraps>

001022d4 <vector121>:
.globl vector121
vector121:
  pushl $0
  1022d4:	6a 00                	push   $0x0
  pushl $121
  1022d6:	6a 79                	push   $0x79
  jmp __alltraps
  1022d8:	e9 36 06 00 00       	jmp    102913 <__alltraps>

001022dd <vector122>:
.globl vector122
vector122:
  pushl $0
  1022dd:	6a 00                	push   $0x0
  pushl $122
  1022df:	6a 7a                	push   $0x7a
  jmp __alltraps
  1022e1:	e9 2d 06 00 00       	jmp    102913 <__alltraps>

001022e6 <vector123>:
.globl vector123
vector123:
  pushl $0
  1022e6:	6a 00                	push   $0x0
  pushl $123
  1022e8:	6a 7b                	push   $0x7b
  jmp __alltraps
  1022ea:	e9 24 06 00 00       	jmp    102913 <__alltraps>

001022ef <vector124>:
.globl vector124
vector124:
  pushl $0
  1022ef:	6a 00                	push   $0x0
  pushl $124
  1022f1:	6a 7c                	push   $0x7c
  jmp __alltraps
  1022f3:	e9 1b 06 00 00       	jmp    102913 <__alltraps>

001022f8 <vector125>:
.globl vector125
vector125:
  pushl $0
  1022f8:	6a 00                	push   $0x0
  pushl $125
  1022fa:	6a 7d                	push   $0x7d
  jmp __alltraps
  1022fc:	e9 12 06 00 00       	jmp    102913 <__alltraps>

00102301 <vector126>:
.globl vector126
vector126:
  pushl $0
  102301:	6a 00                	push   $0x0
  pushl $126
  102303:	6a 7e                	push   $0x7e
  jmp __alltraps
  102305:	e9 09 06 00 00       	jmp    102913 <__alltraps>

0010230a <vector127>:
.globl vector127
vector127:
  pushl $0
  10230a:	6a 00                	push   $0x0
  pushl $127
  10230c:	6a 7f                	push   $0x7f
  jmp __alltraps
  10230e:	e9 00 06 00 00       	jmp    102913 <__alltraps>

00102313 <vector128>:
.globl vector128
vector128:
  pushl $0
  102313:	6a 00                	push   $0x0
  pushl $128
  102315:	68 80 00 00 00       	push   $0x80
  jmp __alltraps
  10231a:	e9 f4 05 00 00       	jmp    102913 <__alltraps>

0010231f <vector129>:
.globl vector129
vector129:
  pushl $0
  10231f:	6a 00                	push   $0x0
  pushl $129
  102321:	68 81 00 00 00       	push   $0x81
  jmp __alltraps
  102326:	e9 e8 05 00 00       	jmp    102913 <__alltraps>

0010232b <vector130>:
.globl vector130
vector130:
  pushl $0
  10232b:	6a 00                	push   $0x0
  pushl $130
  10232d:	68 82 00 00 00       	push   $0x82
  jmp __alltraps
  102332:	e9 dc 05 00 00       	jmp    102913 <__alltraps>

00102337 <vector131>:
.globl vector131
vector131:
  pushl $0
  102337:	6a 00                	push   $0x0
  pushl $131
  102339:	68 83 00 00 00       	push   $0x83
  jmp __alltraps
  10233e:	e9 d0 05 00 00       	jmp    102913 <__alltraps>

00102343 <vector132>:
.globl vector132
vector132:
  pushl $0
  102343:	6a 00                	push   $0x0
  pushl $132
  102345:	68 84 00 00 00       	push   $0x84
  jmp __alltraps
  10234a:	e9 c4 05 00 00       	jmp    102913 <__alltraps>

0010234f <vector133>:
.globl vector133
vector133:
  pushl $0
  10234f:	6a 00                	push   $0x0
  pushl $133
  102351:	68 85 00 00 00       	push   $0x85
  jmp __alltraps
  102356:	e9 b8 05 00 00       	jmp    102913 <__alltraps>

0010235b <vector134>:
.globl vector134
vector134:
  pushl $0
  10235b:	6a 00                	push   $0x0
  pushl $134
  10235d:	68 86 00 00 00       	push   $0x86
  jmp __alltraps
  102362:	e9 ac 05 00 00       	jmp    102913 <__alltraps>

00102367 <vector135>:
.globl vector135
vector135:
  pushl $0
  102367:	6a 00                	push   $0x0
  pushl $135
  102369:	68 87 00 00 00       	push   $0x87
  jmp __alltraps
  10236e:	e9 a0 05 00 00       	jmp    102913 <__alltraps>

00102373 <vector136>:
.globl vector136
vector136:
  pushl $0
  102373:	6a 00                	push   $0x0
  pushl $136
  102375:	68 88 00 00 00       	push   $0x88
  jmp __alltraps
  10237a:	e9 94 05 00 00       	jmp    102913 <__alltraps>

0010237f <vector137>:
.globl vector137
vector137:
  pushl $0
  10237f:	6a 00                	push   $0x0
  pushl $137
  102381:	68 89 00 00 00       	push   $0x89
  jmp __alltraps
  102386:	e9 88 05 00 00       	jmp    102913 <__alltraps>

0010238b <vector138>:
.globl vector138
vector138:
  pushl $0
  10238b:	6a 00                	push   $0x0
  pushl $138
  10238d:	68 8a 00 00 00       	push   $0x8a
  jmp __alltraps
  102392:	e9 7c 05 00 00       	jmp    102913 <__alltraps>

00102397 <vector139>:
.globl vector139
vector139:
  pushl $0
  102397:	6a 00                	push   $0x0
  pushl $139
  102399:	68 8b 00 00 00       	push   $0x8b
  jmp __alltraps
  10239e:	e9 70 05 00 00       	jmp    102913 <__alltraps>

001023a3 <vector140>:
.globl vector140
vector140:
  pushl $0
  1023a3:	6a 00                	push   $0x0
  pushl $140
  1023a5:	68 8c 00 00 00       	push   $0x8c
  jmp __alltraps
  1023aa:	e9 64 05 00 00       	jmp    102913 <__alltraps>

001023af <vector141>:
.globl vector141
vector141:
  pushl $0
  1023af:	6a 00                	push   $0x0
  pushl $141
  1023b1:	68 8d 00 00 00       	push   $0x8d
  jmp __alltraps
  1023b6:	e9 58 05 00 00       	jmp    102913 <__alltraps>

001023bb <vector142>:
.globl vector142
vector142:
  pushl $0
  1023bb:	6a 00                	push   $0x0
  pushl $142
  1023bd:	68 8e 00 00 00       	push   $0x8e
  jmp __alltraps
  1023c2:	e9 4c 05 00 00       	jmp    102913 <__alltraps>

001023c7 <vector143>:
.globl vector143
vector143:
  pushl $0
  1023c7:	6a 00                	push   $0x0
  pushl $143
  1023c9:	68 8f 00 00 00       	push   $0x8f
  jmp __alltraps
  1023ce:	e9 40 05 00 00       	jmp    102913 <__alltraps>

001023d3 <vector144>:
.globl vector144
vector144:
  pushl $0
  1023d3:	6a 00                	push   $0x0
  pushl $144
  1023d5:	68 90 00 00 00       	push   $0x90
  jmp __alltraps
  1023da:	e9 34 05 00 00       	jmp    102913 <__alltraps>

001023df <vector145>:
.globl vector145
vector145:
  pushl $0
  1023df:	6a 00                	push   $0x0
  pushl $145
  1023e1:	68 91 00 00 00       	push   $0x91
  jmp __alltraps
  1023e6:	e9 28 05 00 00       	jmp    102913 <__alltraps>

001023eb <vector146>:
.globl vector146
vector146:
  pushl $0
  1023eb:	6a 00                	push   $0x0
  pushl $146
  1023ed:	68 92 00 00 00       	push   $0x92
  jmp __alltraps
  1023f2:	e9 1c 05 00 00       	jmp    102913 <__alltraps>

001023f7 <vector147>:
.globl vector147
vector147:
  pushl $0
  1023f7:	6a 00                	push   $0x0
  pushl $147
  1023f9:	68 93 00 00 00       	push   $0x93
  jmp __alltraps
  1023fe:	e9 10 05 00 00       	jmp    102913 <__alltraps>

00102403 <vector148>:
.globl vector148
vector148:
  pushl $0
  102403:	6a 00                	push   $0x0
  pushl $148
  102405:	68 94 00 00 00       	push   $0x94
  jmp __alltraps
  10240a:	e9 04 05 00 00       	jmp    102913 <__alltraps>

0010240f <vector149>:
.globl vector149
vector149:
  pushl $0
  10240f:	6a 00                	push   $0x0
  pushl $149
  102411:	68 95 00 00 00       	push   $0x95
  jmp __alltraps
  102416:	e9 f8 04 00 00       	jmp    102913 <__alltraps>

0010241b <vector150>:
.globl vector150
vector150:
  pushl $0
  10241b:	6a 00                	push   $0x0
  pushl $150
  10241d:	68 96 00 00 00       	push   $0x96
  jmp __alltraps
  102422:	e9 ec 04 00 00       	jmp    102913 <__alltraps>

00102427 <vector151>:
.globl vector151
vector151:
  pushl $0
  102427:	6a 00                	push   $0x0
  pushl $151
  102429:	68 97 00 00 00       	push   $0x97
  jmp __alltraps
  10242e:	e9 e0 04 00 00       	jmp    102913 <__alltraps>

00102433 <vector152>:
.globl vector152
vector152:
  pushl $0
  102433:	6a 00                	push   $0x0
  pushl $152
  102435:	68 98 00 00 00       	push   $0x98
  jmp __alltraps
  10243a:	e9 d4 04 00 00       	jmp    102913 <__alltraps>

0010243f <vector153>:
.globl vector153
vector153:
  pushl $0
  10243f:	6a 00                	push   $0x0
  pushl $153
  102441:	68 99 00 00 00       	push   $0x99
  jmp __alltraps
  102446:	e9 c8 04 00 00       	jmp    102913 <__alltraps>

0010244b <vector154>:
.globl vector154
vector154:
  pushl $0
  10244b:	6a 00                	push   $0x0
  pushl $154
  10244d:	68 9a 00 00 00       	push   $0x9a
  jmp __alltraps
  102452:	e9 bc 04 00 00       	jmp    102913 <__alltraps>

00102457 <vector155>:
.globl vector155
vector155:
  pushl $0
  102457:	6a 00                	push   $0x0
  pushl $155
  102459:	68 9b 00 00 00       	push   $0x9b
  jmp __alltraps
  10245e:	e9 b0 04 00 00       	jmp    102913 <__alltraps>

00102463 <vector156>:
.globl vector156
vector156:
  pushl $0
  102463:	6a 00                	push   $0x0
  pushl $156
  102465:	68 9c 00 00 00       	push   $0x9c
  jmp __alltraps
  10246a:	e9 a4 04 00 00       	jmp    102913 <__alltraps>

0010246f <vector157>:
.globl vector157
vector157:
  pushl $0
  10246f:	6a 00                	push   $0x0
  pushl $157
  102471:	68 9d 00 00 00       	push   $0x9d
  jmp __alltraps
  102476:	e9 98 04 00 00       	jmp    102913 <__alltraps>

0010247b <vector158>:
.globl vector158
vector158:
  pushl $0
  10247b:	6a 00                	push   $0x0
  pushl $158
  10247d:	68 9e 00 00 00       	push   $0x9e
  jmp __alltraps
  102482:	e9 8c 04 00 00       	jmp    102913 <__alltraps>

00102487 <vector159>:
.globl vector159
vector159:
  pushl $0
  102487:	6a 00                	push   $0x0
  pushl $159
  102489:	68 9f 00 00 00       	push   $0x9f
  jmp __alltraps
  10248e:	e9 80 04 00 00       	jmp    102913 <__alltraps>

00102493 <vector160>:
.globl vector160
vector160:
  pushl $0
  102493:	6a 00                	push   $0x0
  pushl $160
  102495:	68 a0 00 00 00       	push   $0xa0
  jmp __alltraps
  10249a:	e9 74 04 00 00       	jmp    102913 <__alltraps>

0010249f <vector161>:
.globl vector161
vector161:
  pushl $0
  10249f:	6a 00                	push   $0x0
  pushl $161
  1024a1:	68 a1 00 00 00       	push   $0xa1
  jmp __alltraps
  1024a6:	e9 68 04 00 00       	jmp    102913 <__alltraps>

001024ab <vector162>:
.globl vector162
vector162:
  pushl $0
  1024ab:	6a 00                	push   $0x0
  pushl $162
  1024ad:	68 a2 00 00 00       	push   $0xa2
  jmp __alltraps
  1024b2:	e9 5c 04 00 00       	jmp    102913 <__alltraps>

001024b7 <vector163>:
.globl vector163
vector163:
  pushl $0
  1024b7:	6a 00                	push   $0x0
  pushl $163
  1024b9:	68 a3 00 00 00       	push   $0xa3
  jmp __alltraps
  1024be:	e9 50 04 00 00       	jmp    102913 <__alltraps>

001024c3 <vector164>:
.globl vector164
vector164:
  pushl $0
  1024c3:	6a 00                	push   $0x0
  pushl $164
  1024c5:	68 a4 00 00 00       	push   $0xa4
  jmp __alltraps
  1024ca:	e9 44 04 00 00       	jmp    102913 <__alltraps>

001024cf <vector165>:
.globl vector165
vector165:
  pushl $0
  1024cf:	6a 00                	push   $0x0
  pushl $165
  1024d1:	68 a5 00 00 00       	push   $0xa5
  jmp __alltraps
  1024d6:	e9 38 04 00 00       	jmp    102913 <__alltraps>

001024db <vector166>:
.globl vector166
vector166:
  pushl $0
  1024db:	6a 00                	push   $0x0
  pushl $166
  1024dd:	68 a6 00 00 00       	push   $0xa6
  jmp __alltraps
  1024e2:	e9 2c 04 00 00       	jmp    102913 <__alltraps>

001024e7 <vector167>:
.globl vector167
vector167:
  pushl $0
  1024e7:	6a 00                	push   $0x0
  pushl $167
  1024e9:	68 a7 00 00 00       	push   $0xa7
  jmp __alltraps
  1024ee:	e9 20 04 00 00       	jmp    102913 <__alltraps>

001024f3 <vector168>:
.globl vector168
vector168:
  pushl $0
  1024f3:	6a 00                	push   $0x0
  pushl $168
  1024f5:	68 a8 00 00 00       	push   $0xa8
  jmp __alltraps
  1024fa:	e9 14 04 00 00       	jmp    102913 <__alltraps>

001024ff <vector169>:
.globl vector169
vector169:
  pushl $0
  1024ff:	6a 00                	push   $0x0
  pushl $169
  102501:	68 a9 00 00 00       	push   $0xa9
  jmp __alltraps
  102506:	e9 08 04 00 00       	jmp    102913 <__alltraps>

0010250b <vector170>:
.globl vector170
vector170:
  pushl $0
  10250b:	6a 00                	push   $0x0
  pushl $170
  10250d:	68 aa 00 00 00       	push   $0xaa
  jmp __alltraps
  102512:	e9 fc 03 00 00       	jmp    102913 <__alltraps>

00102517 <vector171>:
.globl vector171
vector171:
  pushl $0
  102517:	6a 00                	push   $0x0
  pushl $171
  102519:	68 ab 00 00 00       	push   $0xab
  jmp __alltraps
  10251e:	e9 f0 03 00 00       	jmp    102913 <__alltraps>

00102523 <vector172>:
.globl vector172
vector172:
  pushl $0
  102523:	6a 00                	push   $0x0
  pushl $172
  102525:	68 ac 00 00 00       	push   $0xac
  jmp __alltraps
  10252a:	e9 e4 03 00 00       	jmp    102913 <__alltraps>

0010252f <vector173>:
.globl vector173
vector173:
  pushl $0
  10252f:	6a 00                	push   $0x0
  pushl $173
  102531:	68 ad 00 00 00       	push   $0xad
  jmp __alltraps
  102536:	e9 d8 03 00 00       	jmp    102913 <__alltraps>

0010253b <vector174>:
.globl vector174
vector174:
  pushl $0
  10253b:	6a 00                	push   $0x0
  pushl $174
  10253d:	68 ae 00 00 00       	push   $0xae
  jmp __alltraps
  102542:	e9 cc 03 00 00       	jmp    102913 <__alltraps>

00102547 <vector175>:
.globl vector175
vector175:
  pushl $0
  102547:	6a 00                	push   $0x0
  pushl $175
  102549:	68 af 00 00 00       	push   $0xaf
  jmp __alltraps
  10254e:	e9 c0 03 00 00       	jmp    102913 <__alltraps>

00102553 <vector176>:
.globl vector176
vector176:
  pushl $0
  102553:	6a 00                	push   $0x0
  pushl $176
  102555:	68 b0 00 00 00       	push   $0xb0
  jmp __alltraps
  10255a:	e9 b4 03 00 00       	jmp    102913 <__alltraps>

0010255f <vector177>:
.globl vector177
vector177:
  pushl $0
  10255f:	6a 00                	push   $0x0
  pushl $177
  102561:	68 b1 00 00 00       	push   $0xb1
  jmp __alltraps
  102566:	e9 a8 03 00 00       	jmp    102913 <__alltraps>

0010256b <vector178>:
.globl vector178
vector178:
  pushl $0
  10256b:	6a 00                	push   $0x0
  pushl $178
  10256d:	68 b2 00 00 00       	push   $0xb2
  jmp __alltraps
  102572:	e9 9c 03 00 00       	jmp    102913 <__alltraps>

00102577 <vector179>:
.globl vector179
vector179:
  pushl $0
  102577:	6a 00                	push   $0x0
  pushl $179
  102579:	68 b3 00 00 00       	push   $0xb3
  jmp __alltraps
  10257e:	e9 90 03 00 00       	jmp    102913 <__alltraps>

00102583 <vector180>:
.globl vector180
vector180:
  pushl $0
  102583:	6a 00                	push   $0x0
  pushl $180
  102585:	68 b4 00 00 00       	push   $0xb4
  jmp __alltraps
  10258a:	e9 84 03 00 00       	jmp    102913 <__alltraps>

0010258f <vector181>:
.globl vector181
vector181:
  pushl $0
  10258f:	6a 00                	push   $0x0
  pushl $181
  102591:	68 b5 00 00 00       	push   $0xb5
  jmp __alltraps
  102596:	e9 78 03 00 00       	jmp    102913 <__alltraps>

0010259b <vector182>:
.globl vector182
vector182:
  pushl $0
  10259b:	6a 00                	push   $0x0
  pushl $182
  10259d:	68 b6 00 00 00       	push   $0xb6
  jmp __alltraps
  1025a2:	e9 6c 03 00 00       	jmp    102913 <__alltraps>

001025a7 <vector183>:
.globl vector183
vector183:
  pushl $0
  1025a7:	6a 00                	push   $0x0
  pushl $183
  1025a9:	68 b7 00 00 00       	push   $0xb7
  jmp __alltraps
  1025ae:	e9 60 03 00 00       	jmp    102913 <__alltraps>

001025b3 <vector184>:
.globl vector184
vector184:
  pushl $0
  1025b3:	6a 00                	push   $0x0
  pushl $184
  1025b5:	68 b8 00 00 00       	push   $0xb8
  jmp __alltraps
  1025ba:	e9 54 03 00 00       	jmp    102913 <__alltraps>

001025bf <vector185>:
.globl vector185
vector185:
  pushl $0
  1025bf:	6a 00                	push   $0x0
  pushl $185
  1025c1:	68 b9 00 00 00       	push   $0xb9
  jmp __alltraps
  1025c6:	e9 48 03 00 00       	jmp    102913 <__alltraps>

001025cb <vector186>:
.globl vector186
vector186:
  pushl $0
  1025cb:	6a 00                	push   $0x0
  pushl $186
  1025cd:	68 ba 00 00 00       	push   $0xba
  jmp __alltraps
  1025d2:	e9 3c 03 00 00       	jmp    102913 <__alltraps>

001025d7 <vector187>:
.globl vector187
vector187:
  pushl $0
  1025d7:	6a 00                	push   $0x0
  pushl $187
  1025d9:	68 bb 00 00 00       	push   $0xbb
  jmp __alltraps
  1025de:	e9 30 03 00 00       	jmp    102913 <__alltraps>

001025e3 <vector188>:
.globl vector188
vector188:
  pushl $0
  1025e3:	6a 00                	push   $0x0
  pushl $188
  1025e5:	68 bc 00 00 00       	push   $0xbc
  jmp __alltraps
  1025ea:	e9 24 03 00 00       	jmp    102913 <__alltraps>

001025ef <vector189>:
.globl vector189
vector189:
  pushl $0
  1025ef:	6a 00                	push   $0x0
  pushl $189
  1025f1:	68 bd 00 00 00       	push   $0xbd
  jmp __alltraps
  1025f6:	e9 18 03 00 00       	jmp    102913 <__alltraps>

001025fb <vector190>:
.globl vector190
vector190:
  pushl $0
  1025fb:	6a 00                	push   $0x0
  pushl $190
  1025fd:	68 be 00 00 00       	push   $0xbe
  jmp __alltraps
  102602:	e9 0c 03 00 00       	jmp    102913 <__alltraps>

00102607 <vector191>:
.globl vector191
vector191:
  pushl $0
  102607:	6a 00                	push   $0x0
  pushl $191
  102609:	68 bf 00 00 00       	push   $0xbf
  jmp __alltraps
  10260e:	e9 00 03 00 00       	jmp    102913 <__alltraps>

00102613 <vector192>:
.globl vector192
vector192:
  pushl $0
  102613:	6a 00                	push   $0x0
  pushl $192
  102615:	68 c0 00 00 00       	push   $0xc0
  jmp __alltraps
  10261a:	e9 f4 02 00 00       	jmp    102913 <__alltraps>

0010261f <vector193>:
.globl vector193
vector193:
  pushl $0
  10261f:	6a 00                	push   $0x0
  pushl $193
  102621:	68 c1 00 00 00       	push   $0xc1
  jmp __alltraps
  102626:	e9 e8 02 00 00       	jmp    102913 <__alltraps>

0010262b <vector194>:
.globl vector194
vector194:
  pushl $0
  10262b:	6a 00                	push   $0x0
  pushl $194
  10262d:	68 c2 00 00 00       	push   $0xc2
  jmp __alltraps
  102632:	e9 dc 02 00 00       	jmp    102913 <__alltraps>

00102637 <vector195>:
.globl vector195
vector195:
  pushl $0
  102637:	6a 00                	push   $0x0
  pushl $195
  102639:	68 c3 00 00 00       	push   $0xc3
  jmp __alltraps
  10263e:	e9 d0 02 00 00       	jmp    102913 <__alltraps>

00102643 <vector196>:
.globl vector196
vector196:
  pushl $0
  102643:	6a 00                	push   $0x0
  pushl $196
  102645:	68 c4 00 00 00       	push   $0xc4
  jmp __alltraps
  10264a:	e9 c4 02 00 00       	jmp    102913 <__alltraps>

0010264f <vector197>:
.globl vector197
vector197:
  pushl $0
  10264f:	6a 00                	push   $0x0
  pushl $197
  102651:	68 c5 00 00 00       	push   $0xc5
  jmp __alltraps
  102656:	e9 b8 02 00 00       	jmp    102913 <__alltraps>

0010265b <vector198>:
.globl vector198
vector198:
  pushl $0
  10265b:	6a 00                	push   $0x0
  pushl $198
  10265d:	68 c6 00 00 00       	push   $0xc6
  jmp __alltraps
  102662:	e9 ac 02 00 00       	jmp    102913 <__alltraps>

00102667 <vector199>:
.globl vector199
vector199:
  pushl $0
  102667:	6a 00                	push   $0x0
  pushl $199
  102669:	68 c7 00 00 00       	push   $0xc7
  jmp __alltraps
  10266e:	e9 a0 02 00 00       	jmp    102913 <__alltraps>

00102673 <vector200>:
.globl vector200
vector200:
  pushl $0
  102673:	6a 00                	push   $0x0
  pushl $200
  102675:	68 c8 00 00 00       	push   $0xc8
  jmp __alltraps
  10267a:	e9 94 02 00 00       	jmp    102913 <__alltraps>

0010267f <vector201>:
.globl vector201
vector201:
  pushl $0
  10267f:	6a 00                	push   $0x0
  pushl $201
  102681:	68 c9 00 00 00       	push   $0xc9
  jmp __alltraps
  102686:	e9 88 02 00 00       	jmp    102913 <__alltraps>

0010268b <vector202>:
.globl vector202
vector202:
  pushl $0
  10268b:	6a 00                	push   $0x0
  pushl $202
  10268d:	68 ca 00 00 00       	push   $0xca
  jmp __alltraps
  102692:	e9 7c 02 00 00       	jmp    102913 <__alltraps>

00102697 <vector203>:
.globl vector203
vector203:
  pushl $0
  102697:	6a 00                	push   $0x0
  pushl $203
  102699:	68 cb 00 00 00       	push   $0xcb
  jmp __alltraps
  10269e:	e9 70 02 00 00       	jmp    102913 <__alltraps>

001026a3 <vector204>:
.globl vector204
vector204:
  pushl $0
  1026a3:	6a 00                	push   $0x0
  pushl $204
  1026a5:	68 cc 00 00 00       	push   $0xcc
  jmp __alltraps
  1026aa:	e9 64 02 00 00       	jmp    102913 <__alltraps>

001026af <vector205>:
.globl vector205
vector205:
  pushl $0
  1026af:	6a 00                	push   $0x0
  pushl $205
  1026b1:	68 cd 00 00 00       	push   $0xcd
  jmp __alltraps
  1026b6:	e9 58 02 00 00       	jmp    102913 <__alltraps>

001026bb <vector206>:
.globl vector206
vector206:
  pushl $0
  1026bb:	6a 00                	push   $0x0
  pushl $206
  1026bd:	68 ce 00 00 00       	push   $0xce
  jmp __alltraps
  1026c2:	e9 4c 02 00 00       	jmp    102913 <__alltraps>

001026c7 <vector207>:
.globl vector207
vector207:
  pushl $0
  1026c7:	6a 00                	push   $0x0
  pushl $207
  1026c9:	68 cf 00 00 00       	push   $0xcf
  jmp __alltraps
  1026ce:	e9 40 02 00 00       	jmp    102913 <__alltraps>

001026d3 <vector208>:
.globl vector208
vector208:
  pushl $0
  1026d3:	6a 00                	push   $0x0
  pushl $208
  1026d5:	68 d0 00 00 00       	push   $0xd0
  jmp __alltraps
  1026da:	e9 34 02 00 00       	jmp    102913 <__alltraps>

001026df <vector209>:
.globl vector209
vector209:
  pushl $0
  1026df:	6a 00                	push   $0x0
  pushl $209
  1026e1:	68 d1 00 00 00       	push   $0xd1
  jmp __alltraps
  1026e6:	e9 28 02 00 00       	jmp    102913 <__alltraps>

001026eb <vector210>:
.globl vector210
vector210:
  pushl $0
  1026eb:	6a 00                	push   $0x0
  pushl $210
  1026ed:	68 d2 00 00 00       	push   $0xd2
  jmp __alltraps
  1026f2:	e9 1c 02 00 00       	jmp    102913 <__alltraps>

001026f7 <vector211>:
.globl vector211
vector211:
  pushl $0
  1026f7:	6a 00                	push   $0x0
  pushl $211
  1026f9:	68 d3 00 00 00       	push   $0xd3
  jmp __alltraps
  1026fe:	e9 10 02 00 00       	jmp    102913 <__alltraps>

00102703 <vector212>:
.globl vector212
vector212:
  pushl $0
  102703:	6a 00                	push   $0x0
  pushl $212
  102705:	68 d4 00 00 00       	push   $0xd4
  jmp __alltraps
  10270a:	e9 04 02 00 00       	jmp    102913 <__alltraps>

0010270f <vector213>:
.globl vector213
vector213:
  pushl $0
  10270f:	6a 00                	push   $0x0
  pushl $213
  102711:	68 d5 00 00 00       	push   $0xd5
  jmp __alltraps
  102716:	e9 f8 01 00 00       	jmp    102913 <__alltraps>

0010271b <vector214>:
.globl vector214
vector214:
  pushl $0
  10271b:	6a 00                	push   $0x0
  pushl $214
  10271d:	68 d6 00 00 00       	push   $0xd6
  jmp __alltraps
  102722:	e9 ec 01 00 00       	jmp    102913 <__alltraps>

00102727 <vector215>:
.globl vector215
vector215:
  pushl $0
  102727:	6a 00                	push   $0x0
  pushl $215
  102729:	68 d7 00 00 00       	push   $0xd7
  jmp __alltraps
  10272e:	e9 e0 01 00 00       	jmp    102913 <__alltraps>

00102733 <vector216>:
.globl vector216
vector216:
  pushl $0
  102733:	6a 00                	push   $0x0
  pushl $216
  102735:	68 d8 00 00 00       	push   $0xd8
  jmp __alltraps
  10273a:	e9 d4 01 00 00       	jmp    102913 <__alltraps>

0010273f <vector217>:
.globl vector217
vector217:
  pushl $0
  10273f:	6a 00                	push   $0x0
  pushl $217
  102741:	68 d9 00 00 00       	push   $0xd9
  jmp __alltraps
  102746:	e9 c8 01 00 00       	jmp    102913 <__alltraps>

0010274b <vector218>:
.globl vector218
vector218:
  pushl $0
  10274b:	6a 00                	push   $0x0
  pushl $218
  10274d:	68 da 00 00 00       	push   $0xda
  jmp __alltraps
  102752:	e9 bc 01 00 00       	jmp    102913 <__alltraps>

00102757 <vector219>:
.globl vector219
vector219:
  pushl $0
  102757:	6a 00                	push   $0x0
  pushl $219
  102759:	68 db 00 00 00       	push   $0xdb
  jmp __alltraps
  10275e:	e9 b0 01 00 00       	jmp    102913 <__alltraps>

00102763 <vector220>:
.globl vector220
vector220:
  pushl $0
  102763:	6a 00                	push   $0x0
  pushl $220
  102765:	68 dc 00 00 00       	push   $0xdc
  jmp __alltraps
  10276a:	e9 a4 01 00 00       	jmp    102913 <__alltraps>

0010276f <vector221>:
.globl vector221
vector221:
  pushl $0
  10276f:	6a 00                	push   $0x0
  pushl $221
  102771:	68 dd 00 00 00       	push   $0xdd
  jmp __alltraps
  102776:	e9 98 01 00 00       	jmp    102913 <__alltraps>

0010277b <vector222>:
.globl vector222
vector222:
  pushl $0
  10277b:	6a 00                	push   $0x0
  pushl $222
  10277d:	68 de 00 00 00       	push   $0xde
  jmp __alltraps
  102782:	e9 8c 01 00 00       	jmp    102913 <__alltraps>

00102787 <vector223>:
.globl vector223
vector223:
  pushl $0
  102787:	6a 00                	push   $0x0
  pushl $223
  102789:	68 df 00 00 00       	push   $0xdf
  jmp __alltraps
  10278e:	e9 80 01 00 00       	jmp    102913 <__alltraps>

00102793 <vector224>:
.globl vector224
vector224:
  pushl $0
  102793:	6a 00                	push   $0x0
  pushl $224
  102795:	68 e0 00 00 00       	push   $0xe0
  jmp __alltraps
  10279a:	e9 74 01 00 00       	jmp    102913 <__alltraps>

0010279f <vector225>:
.globl vector225
vector225:
  pushl $0
  10279f:	6a 00                	push   $0x0
  pushl $225
  1027a1:	68 e1 00 00 00       	push   $0xe1
  jmp __alltraps
  1027a6:	e9 68 01 00 00       	jmp    102913 <__alltraps>

001027ab <vector226>:
.globl vector226
vector226:
  pushl $0
  1027ab:	6a 00                	push   $0x0
  pushl $226
  1027ad:	68 e2 00 00 00       	push   $0xe2
  jmp __alltraps
  1027b2:	e9 5c 01 00 00       	jmp    102913 <__alltraps>

001027b7 <vector227>:
.globl vector227
vector227:
  pushl $0
  1027b7:	6a 00                	push   $0x0
  pushl $227
  1027b9:	68 e3 00 00 00       	push   $0xe3
  jmp __alltraps
  1027be:	e9 50 01 00 00       	jmp    102913 <__alltraps>

001027c3 <vector228>:
.globl vector228
vector228:
  pushl $0
  1027c3:	6a 00                	push   $0x0
  pushl $228
  1027c5:	68 e4 00 00 00       	push   $0xe4
  jmp __alltraps
  1027ca:	e9 44 01 00 00       	jmp    102913 <__alltraps>

001027cf <vector229>:
.globl vector229
vector229:
  pushl $0
  1027cf:	6a 00                	push   $0x0
  pushl $229
  1027d1:	68 e5 00 00 00       	push   $0xe5
  jmp __alltraps
  1027d6:	e9 38 01 00 00       	jmp    102913 <__alltraps>

001027db <vector230>:
.globl vector230
vector230:
  pushl $0
  1027db:	6a 00                	push   $0x0
  pushl $230
  1027dd:	68 e6 00 00 00       	push   $0xe6
  jmp __alltraps
  1027e2:	e9 2c 01 00 00       	jmp    102913 <__alltraps>

001027e7 <vector231>:
.globl vector231
vector231:
  pushl $0
  1027e7:	6a 00                	push   $0x0
  pushl $231
  1027e9:	68 e7 00 00 00       	push   $0xe7
  jmp __alltraps
  1027ee:	e9 20 01 00 00       	jmp    102913 <__alltraps>

001027f3 <vector232>:
.globl vector232
vector232:
  pushl $0
  1027f3:	6a 00                	push   $0x0
  pushl $232
  1027f5:	68 e8 00 00 00       	push   $0xe8
  jmp __alltraps
  1027fa:	e9 14 01 00 00       	jmp    102913 <__alltraps>

001027ff <vector233>:
.globl vector233
vector233:
  pushl $0
  1027ff:	6a 00                	push   $0x0
  pushl $233
  102801:	68 e9 00 00 00       	push   $0xe9
  jmp __alltraps
  102806:	e9 08 01 00 00       	jmp    102913 <__alltraps>

0010280b <vector234>:
.globl vector234
vector234:
  pushl $0
  10280b:	6a 00                	push   $0x0
  pushl $234
  10280d:	68 ea 00 00 00       	push   $0xea
  jmp __alltraps
  102812:	e9 fc 00 00 00       	jmp    102913 <__alltraps>

00102817 <vector235>:
.globl vector235
vector235:
  pushl $0
  102817:	6a 00                	push   $0x0
  pushl $235
  102819:	68 eb 00 00 00       	push   $0xeb
  jmp __alltraps
  10281e:	e9 f0 00 00 00       	jmp    102913 <__alltraps>

00102823 <vector236>:
.globl vector236
vector236:
  pushl $0
  102823:	6a 00                	push   $0x0
  pushl $236
  102825:	68 ec 00 00 00       	push   $0xec
  jmp __alltraps
  10282a:	e9 e4 00 00 00       	jmp    102913 <__alltraps>

0010282f <vector237>:
.globl vector237
vector237:
  pushl $0
  10282f:	6a 00                	push   $0x0
  pushl $237
  102831:	68 ed 00 00 00       	push   $0xed
  jmp __alltraps
  102836:	e9 d8 00 00 00       	jmp    102913 <__alltraps>

0010283b <vector238>:
.globl vector238
vector238:
  pushl $0
  10283b:	6a 00                	push   $0x0
  pushl $238
  10283d:	68 ee 00 00 00       	push   $0xee
  jmp __alltraps
  102842:	e9 cc 00 00 00       	jmp    102913 <__alltraps>

00102847 <vector239>:
.globl vector239
vector239:
  pushl $0
  102847:	6a 00                	push   $0x0
  pushl $239
  102849:	68 ef 00 00 00       	push   $0xef
  jmp __alltraps
  10284e:	e9 c0 00 00 00       	jmp    102913 <__alltraps>

00102853 <vector240>:
.globl vector240
vector240:
  pushl $0
  102853:	6a 00                	push   $0x0
  pushl $240
  102855:	68 f0 00 00 00       	push   $0xf0
  jmp __alltraps
  10285a:	e9 b4 00 00 00       	jmp    102913 <__alltraps>

0010285f <vector241>:
.globl vector241
vector241:
  pushl $0
  10285f:	6a 00                	push   $0x0
  pushl $241
  102861:	68 f1 00 00 00       	push   $0xf1
  jmp __alltraps
  102866:	e9 a8 00 00 00       	jmp    102913 <__alltraps>

0010286b <vector242>:
.globl vector242
vector242:
  pushl $0
  10286b:	6a 00                	push   $0x0
  pushl $242
  10286d:	68 f2 00 00 00       	push   $0xf2
  jmp __alltraps
  102872:	e9 9c 00 00 00       	jmp    102913 <__alltraps>

00102877 <vector243>:
.globl vector243
vector243:
  pushl $0
  102877:	6a 00                	push   $0x0
  pushl $243
  102879:	68 f3 00 00 00       	push   $0xf3
  jmp __alltraps
  10287e:	e9 90 00 00 00       	jmp    102913 <__alltraps>

00102883 <vector244>:
.globl vector244
vector244:
  pushl $0
  102883:	6a 00                	push   $0x0
  pushl $244
  102885:	68 f4 00 00 00       	push   $0xf4
  jmp __alltraps
  10288a:	e9 84 00 00 00       	jmp    102913 <__alltraps>

0010288f <vector245>:
.globl vector245
vector245:
  pushl $0
  10288f:	6a 00                	push   $0x0
  pushl $245
  102891:	68 f5 00 00 00       	push   $0xf5
  jmp __alltraps
  102896:	e9 78 00 00 00       	jmp    102913 <__alltraps>

0010289b <vector246>:
.globl vector246
vector246:
  pushl $0
  10289b:	6a 00                	push   $0x0
  pushl $246
  10289d:	68 f6 00 00 00       	push   $0xf6
  jmp __alltraps
  1028a2:	e9 6c 00 00 00       	jmp    102913 <__alltraps>

001028a7 <vector247>:
.globl vector247
vector247:
  pushl $0
  1028a7:	6a 00                	push   $0x0
  pushl $247
  1028a9:	68 f7 00 00 00       	push   $0xf7
  jmp __alltraps
  1028ae:	e9 60 00 00 00       	jmp    102913 <__alltraps>

001028b3 <vector248>:
.globl vector248
vector248:
  pushl $0
  1028b3:	6a 00                	push   $0x0
  pushl $248
  1028b5:	68 f8 00 00 00       	push   $0xf8
  jmp __alltraps
  1028ba:	e9 54 00 00 00       	jmp    102913 <__alltraps>

001028bf <vector249>:
.globl vector249
vector249:
  pushl $0
  1028bf:	6a 00                	push   $0x0
  pushl $249
  1028c1:	68 f9 00 00 00       	push   $0xf9
  jmp __alltraps
  1028c6:	e9 48 00 00 00       	jmp    102913 <__alltraps>

001028cb <vector250>:
.globl vector250
vector250:
  pushl $0
  1028cb:	6a 00                	push   $0x0
  pushl $250
  1028cd:	68 fa 00 00 00       	push   $0xfa
  jmp __alltraps
  1028d2:	e9 3c 00 00 00       	jmp    102913 <__alltraps>

001028d7 <vector251>:
.globl vector251
vector251:
  pushl $0
  1028d7:	6a 00                	push   $0x0
  pushl $251
  1028d9:	68 fb 00 00 00       	push   $0xfb
  jmp __alltraps
  1028de:	e9 30 00 00 00       	jmp    102913 <__alltraps>

001028e3 <vector252>:
.globl vector252
vector252:
  pushl $0
  1028e3:	6a 00                	push   $0x0
  pushl $252
  1028e5:	68 fc 00 00 00       	push   $0xfc
  jmp __alltraps
  1028ea:	e9 24 00 00 00       	jmp    102913 <__alltraps>

001028ef <vector253>:
.globl vector253
vector253:
  pushl $0
  1028ef:	6a 00                	push   $0x0
  pushl $253
  1028f1:	68 fd 00 00 00       	push   $0xfd
  jmp __alltraps
  1028f6:	e9 18 00 00 00       	jmp    102913 <__alltraps>

001028fb <vector254>:
.globl vector254
vector254:
  pushl $0
  1028fb:	6a 00                	push   $0x0
  pushl $254
  1028fd:	68 fe 00 00 00       	push   $0xfe
  jmp __alltraps
  102902:	e9 0c 00 00 00       	jmp    102913 <__alltraps>

00102907 <vector255>:
.globl vector255
vector255:
  pushl $0
  102907:	6a 00                	push   $0x0
  pushl $255
  102909:	68 ff 00 00 00       	push   $0xff
  jmp __alltraps
  10290e:	e9 00 00 00 00       	jmp    102913 <__alltraps>

00102913 <__alltraps>:
.text
.globl __alltraps
__alltraps:
    # push registers to build a trap frame
    # therefore make the stack look like a struct trapframe
    pushl %ds
  102913:	1e                   	push   %ds
    pushl %es
  102914:	06                   	push   %es
    pushl %fs
  102915:	0f a0                	push   %fs
    pushl %gs
  102917:	0f a8                	push   %gs
    pushal
  102919:	60                   	pusha  

    # load GD_KDATA into %ds and %es to set up data segments for kernel
    movl $GD_KDATA, %eax
  10291a:	b8 10 00 00 00       	mov    $0x10,%eax
    movw %ax, %ds
  10291f:	8e d8                	mov    %eax,%ds
    movw %ax, %es
  102921:	8e c0                	mov    %eax,%es

    # push %esp to pass a pointer to the trapframe as an argument to trap()
    pushl %esp
  102923:	54                   	push   %esp

    # call trap(tf), where tf=%esp
    call trap
  102924:	e8 60 f5 ff ff       	call   101e89 <trap>

    # pop the pushed stack pointer
    popl %esp
  102929:	5c                   	pop    %esp

0010292a <__trapret>:

    # return falls through to trapret...
.globl __trapret
__trapret:
    # restore registers from stack
    popal
  10292a:	61                   	popa   

    # restore %ds, %es, %fs and %gs
    popl %gs
  10292b:	0f a9                	pop    %gs
    popl %fs
  10292d:	0f a1                	pop    %fs
    popl %es
  10292f:	07                   	pop    %es
    popl %ds
  102930:	1f                   	pop    %ds

    # get rid of the trap number and error code
    addl $0x8, %esp
  102931:	83 c4 08             	add    $0x8,%esp
    iret
  102934:	cf                   	iret   

00102935 <lgdt>:
/* *
 * lgdt - load the global descriptor table register and reset the
 * data/code segement registers for kernel.
 * */
static inline void
lgdt(struct pseudodesc *pd) {
  102935:	55                   	push   %ebp
  102936:	89 e5                	mov    %esp,%ebp
    asm volatile ("lgdt (%0)" :: "r" (pd));
  102938:	8b 45 08             	mov    0x8(%ebp),%eax
  10293b:	0f 01 10             	lgdtl  (%eax)
    asm volatile ("movw %%ax, %%gs" :: "a" (USER_DS));
  10293e:	b8 23 00 00 00       	mov    $0x23,%eax
  102943:	8e e8                	mov    %eax,%gs
    asm volatile ("movw %%ax, %%fs" :: "a" (USER_DS));
  102945:	b8 23 00 00 00       	mov    $0x23,%eax
  10294a:	8e e0                	mov    %eax,%fs
    asm volatile ("movw %%ax, %%es" :: "a" (KERNEL_DS));
  10294c:	b8 10 00 00 00       	mov    $0x10,%eax
  102951:	8e c0                	mov    %eax,%es
    asm volatile ("movw %%ax, %%ds" :: "a" (KERNEL_DS));
  102953:	b8 10 00 00 00       	mov    $0x10,%eax
  102958:	8e d8                	mov    %eax,%ds
    asm volatile ("movw %%ax, %%ss" :: "a" (KERNEL_DS));
  10295a:	b8 10 00 00 00       	mov    $0x10,%eax
  10295f:	8e d0                	mov    %eax,%ss
    // reload cs
    asm volatile ("ljmp %0, $1f\n 1:\n" :: "i" (KERNEL_CS));
  102961:	ea 68 29 10 00 08 00 	ljmp   $0x8,$0x102968
}
  102968:	90                   	nop
  102969:	5d                   	pop    %ebp
  10296a:	c3                   	ret    

0010296b <gdt_init>:
/* temporary kernel stack */
uint8_t stack0[1024];

/* gdt_init - initialize the default GDT and TSS */
static void
gdt_init(void) {
  10296b:	f3 0f 1e fb          	endbr32 
  10296f:	55                   	push   %ebp
  102970:	89 e5                	mov    %esp,%ebp
  102972:	83 ec 14             	sub    $0x14,%esp
    // Setup a TSS so that we can get the right stack when we trap from
    // user to the kernel. But not safe here, it's only a temporary value,
    // it will be set to KSTACKTOP in lab2.
    ts.ts_esp0 = (uint32_t)&stack0 + sizeof(stack0);
  102975:	b8 20 09 11 00       	mov    $0x110920,%eax
  10297a:	05 00 04 00 00       	add    $0x400,%eax
  10297f:	a3 a4 08 11 00       	mov    %eax,0x1108a4
    ts.ts_ss0 = KERNEL_DS;
  102984:	66 c7 05 a8 08 11 00 	movw   $0x10,0x1108a8
  10298b:	10 00 

    // initialize the TSS filed of the gdt
    gdt[SEG_TSS] = SEG16(STS_T32A, (uint32_t)&ts, sizeof(ts), DPL_KERNEL);
  10298d:	66 c7 05 08 fa 10 00 	movw   $0x68,0x10fa08
  102994:	68 00 
  102996:	b8 a0 08 11 00       	mov    $0x1108a0,%eax
  10299b:	0f b7 c0             	movzwl %ax,%eax
  10299e:	66 a3 0a fa 10 00    	mov    %ax,0x10fa0a
  1029a4:	b8 a0 08 11 00       	mov    $0x1108a0,%eax
  1029a9:	c1 e8 10             	shr    $0x10,%eax
  1029ac:	a2 0c fa 10 00       	mov    %al,0x10fa0c
  1029b1:	0f b6 05 0d fa 10 00 	movzbl 0x10fa0d,%eax
  1029b8:	24 f0                	and    $0xf0,%al
  1029ba:	0c 09                	or     $0x9,%al
  1029bc:	a2 0d fa 10 00       	mov    %al,0x10fa0d
  1029c1:	0f b6 05 0d fa 10 00 	movzbl 0x10fa0d,%eax
  1029c8:	0c 10                	or     $0x10,%al
  1029ca:	a2 0d fa 10 00       	mov    %al,0x10fa0d
  1029cf:	0f b6 05 0d fa 10 00 	movzbl 0x10fa0d,%eax
  1029d6:	24 9f                	and    $0x9f,%al
  1029d8:	a2 0d fa 10 00       	mov    %al,0x10fa0d
  1029dd:	0f b6 05 0d fa 10 00 	movzbl 0x10fa0d,%eax
  1029e4:	0c 80                	or     $0x80,%al
  1029e6:	a2 0d fa 10 00       	mov    %al,0x10fa0d
  1029eb:	0f b6 05 0e fa 10 00 	movzbl 0x10fa0e,%eax
  1029f2:	24 f0                	and    $0xf0,%al
  1029f4:	a2 0e fa 10 00       	mov    %al,0x10fa0e
  1029f9:	0f b6 05 0e fa 10 00 	movzbl 0x10fa0e,%eax
  102a00:	24 ef                	and    $0xef,%al
  102a02:	a2 0e fa 10 00       	mov    %al,0x10fa0e
  102a07:	0f b6 05 0e fa 10 00 	movzbl 0x10fa0e,%eax
  102a0e:	24 df                	and    $0xdf,%al
  102a10:	a2 0e fa 10 00       	mov    %al,0x10fa0e
  102a15:	0f b6 05 0e fa 10 00 	movzbl 0x10fa0e,%eax
  102a1c:	0c 40                	or     $0x40,%al
  102a1e:	a2 0e fa 10 00       	mov    %al,0x10fa0e
  102a23:	0f b6 05 0e fa 10 00 	movzbl 0x10fa0e,%eax
  102a2a:	24 7f                	and    $0x7f,%al
  102a2c:	a2 0e fa 10 00       	mov    %al,0x10fa0e
  102a31:	b8 a0 08 11 00       	mov    $0x1108a0,%eax
  102a36:	c1 e8 18             	shr    $0x18,%eax
  102a39:	a2 0f fa 10 00       	mov    %al,0x10fa0f
    gdt[SEG_TSS].sd_s = 0;
  102a3e:	0f b6 05 0d fa 10 00 	movzbl 0x10fa0d,%eax
  102a45:	24 ef                	and    $0xef,%al
  102a47:	a2 0d fa 10 00       	mov    %al,0x10fa0d

    // reload all segment registers
    lgdt(&gdt_pd);
  102a4c:	c7 04 24 10 fa 10 00 	movl   $0x10fa10,(%esp)
  102a53:	e8 dd fe ff ff       	call   102935 <lgdt>
  102a58:	66 c7 45 fe 28 00    	movw   $0x28,-0x2(%ebp)

static inline void
ltr(uint16_t sel) {
    asm volatile ("ltr %0" :: "r" (sel));
  102a5e:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  102a62:	0f 00 d8             	ltr    %ax
}
  102a65:	90                   	nop

    // load the TSS
    ltr(GD_TSS);
}
  102a66:	90                   	nop
  102a67:	c9                   	leave  
  102a68:	c3                   	ret    

00102a69 <pmm_init>:

/* pmm_init - initialize the physical memory management */
void
pmm_init(void) {
  102a69:	f3 0f 1e fb          	endbr32 
  102a6d:	55                   	push   %ebp
  102a6e:	89 e5                	mov    %esp,%ebp
    gdt_init();
  102a70:	e8 f6 fe ff ff       	call   10296b <gdt_init>
}
  102a75:	90                   	nop
  102a76:	5d                   	pop    %ebp
  102a77:	c3                   	ret    

00102a78 <strlen>:
 * @s:        the input string
 *
 * The strlen() function returns the length of string @s.
 * */
size_t
strlen(const char *s) {
  102a78:	f3 0f 1e fb          	endbr32 
  102a7c:	55                   	push   %ebp
  102a7d:	89 e5                	mov    %esp,%ebp
  102a7f:	83 ec 10             	sub    $0x10,%esp
    size_t cnt = 0;
  102a82:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    while (*s ++ != '\0') {
  102a89:	eb 03                	jmp    102a8e <strlen+0x16>
        cnt ++;
  102a8b:	ff 45 fc             	incl   -0x4(%ebp)
    while (*s ++ != '\0') {
  102a8e:	8b 45 08             	mov    0x8(%ebp),%eax
  102a91:	8d 50 01             	lea    0x1(%eax),%edx
  102a94:	89 55 08             	mov    %edx,0x8(%ebp)
  102a97:	0f b6 00             	movzbl (%eax),%eax
  102a9a:	84 c0                	test   %al,%al
  102a9c:	75 ed                	jne    102a8b <strlen+0x13>
    }
    return cnt;
  102a9e:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  102aa1:	c9                   	leave  
  102aa2:	c3                   	ret    

00102aa3 <strnlen>:
 * The return value is strlen(s), if that is less than @len, or
 * @len if there is no '\0' character among the first @len characters
 * pointed by @s.
 * */
size_t
strnlen(const char *s, size_t len) {
  102aa3:	f3 0f 1e fb          	endbr32 
  102aa7:	55                   	push   %ebp
  102aa8:	89 e5                	mov    %esp,%ebp
  102aaa:	83 ec 10             	sub    $0x10,%esp
    size_t cnt = 0;
  102aad:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    while (cnt < len && *s ++ != '\0') {
  102ab4:	eb 03                	jmp    102ab9 <strnlen+0x16>
        cnt ++;
  102ab6:	ff 45 fc             	incl   -0x4(%ebp)
    while (cnt < len && *s ++ != '\0') {
  102ab9:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102abc:	3b 45 0c             	cmp    0xc(%ebp),%eax
  102abf:	73 10                	jae    102ad1 <strnlen+0x2e>
  102ac1:	8b 45 08             	mov    0x8(%ebp),%eax
  102ac4:	8d 50 01             	lea    0x1(%eax),%edx
  102ac7:	89 55 08             	mov    %edx,0x8(%ebp)
  102aca:	0f b6 00             	movzbl (%eax),%eax
  102acd:	84 c0                	test   %al,%al
  102acf:	75 e5                	jne    102ab6 <strnlen+0x13>
    }
    return cnt;
  102ad1:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  102ad4:	c9                   	leave  
  102ad5:	c3                   	ret    

00102ad6 <strcpy>:
 * To avoid overflows, the size of array pointed by @dst should be long enough to
 * contain the same string as @src (including the terminating null character), and
 * should not overlap in memory with @src.
 * */
char *
strcpy(char *dst, const char *src) {
  102ad6:	f3 0f 1e fb          	endbr32 
  102ada:	55                   	push   %ebp
  102adb:	89 e5                	mov    %esp,%ebp
  102add:	57                   	push   %edi
  102ade:	56                   	push   %esi
  102adf:	83 ec 20             	sub    $0x20,%esp
  102ae2:	8b 45 08             	mov    0x8(%ebp),%eax
  102ae5:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102ae8:	8b 45 0c             	mov    0xc(%ebp),%eax
  102aeb:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_STRCPY
#define __HAVE_ARCH_STRCPY
static inline char *
__strcpy(char *dst, const char *src) {
    int d0, d1, d2;
    asm volatile (
  102aee:	8b 55 f0             	mov    -0x10(%ebp),%edx
  102af1:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102af4:	89 d1                	mov    %edx,%ecx
  102af6:	89 c2                	mov    %eax,%edx
  102af8:	89 ce                	mov    %ecx,%esi
  102afa:	89 d7                	mov    %edx,%edi
  102afc:	ac                   	lods   %ds:(%esi),%al
  102afd:	aa                   	stos   %al,%es:(%edi)
  102afe:	84 c0                	test   %al,%al
  102b00:	75 fa                	jne    102afc <strcpy+0x26>
  102b02:	89 fa                	mov    %edi,%edx
  102b04:	89 f1                	mov    %esi,%ecx
  102b06:	89 4d ec             	mov    %ecx,-0x14(%ebp)
  102b09:	89 55 e8             	mov    %edx,-0x18(%ebp)
  102b0c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            "stosb;"
            "testb %%al, %%al;"
            "jne 1b;"
            : "=&S" (d0), "=&D" (d1), "=&a" (d2)
            : "0" (src), "1" (dst) : "memory");
    return dst;
  102b0f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    char *p = dst;
    while ((*p ++ = *src ++) != '\0')
        /* nothing */;
    return dst;
#endif /* __HAVE_ARCH_STRCPY */
}
  102b12:	83 c4 20             	add    $0x20,%esp
  102b15:	5e                   	pop    %esi
  102b16:	5f                   	pop    %edi
  102b17:	5d                   	pop    %ebp
  102b18:	c3                   	ret    

00102b19 <strncpy>:
 * @len:    maximum number of characters to be copied from @src
 *
 * The return value is @dst
 * */
char *
strncpy(char *dst, const char *src, size_t len) {
  102b19:	f3 0f 1e fb          	endbr32 
  102b1d:	55                   	push   %ebp
  102b1e:	89 e5                	mov    %esp,%ebp
  102b20:	83 ec 10             	sub    $0x10,%esp
    char *p = dst;
  102b23:	8b 45 08             	mov    0x8(%ebp),%eax
  102b26:	89 45 fc             	mov    %eax,-0x4(%ebp)
    while (len > 0) {
  102b29:	eb 1e                	jmp    102b49 <strncpy+0x30>
        if ((*p = *src) != '\0') {
  102b2b:	8b 45 0c             	mov    0xc(%ebp),%eax
  102b2e:	0f b6 10             	movzbl (%eax),%edx
  102b31:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102b34:	88 10                	mov    %dl,(%eax)
  102b36:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102b39:	0f b6 00             	movzbl (%eax),%eax
  102b3c:	84 c0                	test   %al,%al
  102b3e:	74 03                	je     102b43 <strncpy+0x2a>
            src ++;
  102b40:	ff 45 0c             	incl   0xc(%ebp)
        }
        p ++, len --;
  102b43:	ff 45 fc             	incl   -0x4(%ebp)
  102b46:	ff 4d 10             	decl   0x10(%ebp)
    while (len > 0) {
  102b49:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102b4d:	75 dc                	jne    102b2b <strncpy+0x12>
    }
    return dst;
  102b4f:	8b 45 08             	mov    0x8(%ebp),%eax
}
  102b52:	c9                   	leave  
  102b53:	c3                   	ret    

00102b54 <strcmp>:
 * - A value greater than zero indicates that the first character that does
 *   not match has a greater value in @s1 than in @s2;
 * - And a value less than zero indicates the opposite.
 * */
int
strcmp(const char *s1, const char *s2) {
  102b54:	f3 0f 1e fb          	endbr32 
  102b58:	55                   	push   %ebp
  102b59:	89 e5                	mov    %esp,%ebp
  102b5b:	57                   	push   %edi
  102b5c:	56                   	push   %esi
  102b5d:	83 ec 20             	sub    $0x20,%esp
  102b60:	8b 45 08             	mov    0x8(%ebp),%eax
  102b63:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102b66:	8b 45 0c             	mov    0xc(%ebp),%eax
  102b69:	89 45 f0             	mov    %eax,-0x10(%ebp)
    asm volatile (
  102b6c:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102b6f:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102b72:	89 d1                	mov    %edx,%ecx
  102b74:	89 c2                	mov    %eax,%edx
  102b76:	89 ce                	mov    %ecx,%esi
  102b78:	89 d7                	mov    %edx,%edi
  102b7a:	ac                   	lods   %ds:(%esi),%al
  102b7b:	ae                   	scas   %es:(%edi),%al
  102b7c:	75 08                	jne    102b86 <strcmp+0x32>
  102b7e:	84 c0                	test   %al,%al
  102b80:	75 f8                	jne    102b7a <strcmp+0x26>
  102b82:	31 c0                	xor    %eax,%eax
  102b84:	eb 04                	jmp    102b8a <strcmp+0x36>
  102b86:	19 c0                	sbb    %eax,%eax
  102b88:	0c 01                	or     $0x1,%al
  102b8a:	89 fa                	mov    %edi,%edx
  102b8c:	89 f1                	mov    %esi,%ecx
  102b8e:	89 45 ec             	mov    %eax,-0x14(%ebp)
  102b91:	89 4d e8             	mov    %ecx,-0x18(%ebp)
  102b94:	89 55 e4             	mov    %edx,-0x1c(%ebp)
    return ret;
  102b97:	8b 45 ec             	mov    -0x14(%ebp),%eax
    while (*s1 != '\0' && *s1 == *s2) {
        s1 ++, s2 ++;
    }
    return (int)((unsigned char)*s1 - (unsigned char)*s2);
#endif /* __HAVE_ARCH_STRCMP */
}
  102b9a:	83 c4 20             	add    $0x20,%esp
  102b9d:	5e                   	pop    %esi
  102b9e:	5f                   	pop    %edi
  102b9f:	5d                   	pop    %ebp
  102ba0:	c3                   	ret    

00102ba1 <strncmp>:
 * they are equal to each other, it continues with the following pairs until
 * the characters differ, until a terminating null-character is reached, or
 * until @n characters match in both strings, whichever happens first.
 * */
int
strncmp(const char *s1, const char *s2, size_t n) {
  102ba1:	f3 0f 1e fb          	endbr32 
  102ba5:	55                   	push   %ebp
  102ba6:	89 e5                	mov    %esp,%ebp
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
  102ba8:	eb 09                	jmp    102bb3 <strncmp+0x12>
        n --, s1 ++, s2 ++;
  102baa:	ff 4d 10             	decl   0x10(%ebp)
  102bad:	ff 45 08             	incl   0x8(%ebp)
  102bb0:	ff 45 0c             	incl   0xc(%ebp)
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
  102bb3:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102bb7:	74 1a                	je     102bd3 <strncmp+0x32>
  102bb9:	8b 45 08             	mov    0x8(%ebp),%eax
  102bbc:	0f b6 00             	movzbl (%eax),%eax
  102bbf:	84 c0                	test   %al,%al
  102bc1:	74 10                	je     102bd3 <strncmp+0x32>
  102bc3:	8b 45 08             	mov    0x8(%ebp),%eax
  102bc6:	0f b6 10             	movzbl (%eax),%edx
  102bc9:	8b 45 0c             	mov    0xc(%ebp),%eax
  102bcc:	0f b6 00             	movzbl (%eax),%eax
  102bcf:	38 c2                	cmp    %al,%dl
  102bd1:	74 d7                	je     102baa <strncmp+0x9>
    }
    return (n == 0) ? 0 : (int)((unsigned char)*s1 - (unsigned char)*s2);
  102bd3:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102bd7:	74 18                	je     102bf1 <strncmp+0x50>
  102bd9:	8b 45 08             	mov    0x8(%ebp),%eax
  102bdc:	0f b6 00             	movzbl (%eax),%eax
  102bdf:	0f b6 d0             	movzbl %al,%edx
  102be2:	8b 45 0c             	mov    0xc(%ebp),%eax
  102be5:	0f b6 00             	movzbl (%eax),%eax
  102be8:	0f b6 c0             	movzbl %al,%eax
  102beb:	29 c2                	sub    %eax,%edx
  102bed:	89 d0                	mov    %edx,%eax
  102bef:	eb 05                	jmp    102bf6 <strncmp+0x55>
  102bf1:	b8 00 00 00 00       	mov    $0x0,%eax
}
  102bf6:	5d                   	pop    %ebp
  102bf7:	c3                   	ret    

00102bf8 <strchr>:
 *
 * The strchr() function returns a pointer to the first occurrence of
 * character in @s. If the value is not found, the function returns 'NULL'.
 * */
char *
strchr(const char *s, char c) {
  102bf8:	f3 0f 1e fb          	endbr32 
  102bfc:	55                   	push   %ebp
  102bfd:	89 e5                	mov    %esp,%ebp
  102bff:	83 ec 04             	sub    $0x4,%esp
  102c02:	8b 45 0c             	mov    0xc(%ebp),%eax
  102c05:	88 45 fc             	mov    %al,-0x4(%ebp)
    while (*s != '\0') {
  102c08:	eb 13                	jmp    102c1d <strchr+0x25>
        if (*s == c) {
  102c0a:	8b 45 08             	mov    0x8(%ebp),%eax
  102c0d:	0f b6 00             	movzbl (%eax),%eax
  102c10:	38 45 fc             	cmp    %al,-0x4(%ebp)
  102c13:	75 05                	jne    102c1a <strchr+0x22>
            return (char *)s;
  102c15:	8b 45 08             	mov    0x8(%ebp),%eax
  102c18:	eb 12                	jmp    102c2c <strchr+0x34>
        }
        s ++;
  102c1a:	ff 45 08             	incl   0x8(%ebp)
    while (*s != '\0') {
  102c1d:	8b 45 08             	mov    0x8(%ebp),%eax
  102c20:	0f b6 00             	movzbl (%eax),%eax
  102c23:	84 c0                	test   %al,%al
  102c25:	75 e3                	jne    102c0a <strchr+0x12>
    }
    return NULL;
  102c27:	b8 00 00 00 00       	mov    $0x0,%eax
}
  102c2c:	c9                   	leave  
  102c2d:	c3                   	ret    

00102c2e <strfind>:
 * The strfind() function is like strchr() except that if @c is
 * not found in @s, then it returns a pointer to the null byte at the
 * end of @s, rather than 'NULL'.
 * */
char *
strfind(const char *s, char c) {
  102c2e:	f3 0f 1e fb          	endbr32 
  102c32:	55                   	push   %ebp
  102c33:	89 e5                	mov    %esp,%ebp
  102c35:	83 ec 04             	sub    $0x4,%esp
  102c38:	8b 45 0c             	mov    0xc(%ebp),%eax
  102c3b:	88 45 fc             	mov    %al,-0x4(%ebp)
    while (*s != '\0') {
  102c3e:	eb 0e                	jmp    102c4e <strfind+0x20>
        if (*s == c) {
  102c40:	8b 45 08             	mov    0x8(%ebp),%eax
  102c43:	0f b6 00             	movzbl (%eax),%eax
  102c46:	38 45 fc             	cmp    %al,-0x4(%ebp)
  102c49:	74 0f                	je     102c5a <strfind+0x2c>
            break;
        }
        s ++;
  102c4b:	ff 45 08             	incl   0x8(%ebp)
    while (*s != '\0') {
  102c4e:	8b 45 08             	mov    0x8(%ebp),%eax
  102c51:	0f b6 00             	movzbl (%eax),%eax
  102c54:	84 c0                	test   %al,%al
  102c56:	75 e8                	jne    102c40 <strfind+0x12>
  102c58:	eb 01                	jmp    102c5b <strfind+0x2d>
            break;
  102c5a:	90                   	nop
    }
    return (char *)s;
  102c5b:	8b 45 08             	mov    0x8(%ebp),%eax
}
  102c5e:	c9                   	leave  
  102c5f:	c3                   	ret    

00102c60 <strtol>:
 * an optional "0x" or "0X" prefix.
 *
 * The strtol() function returns the converted integral number as a long int value.
 * */
long
strtol(const char *s, char **endptr, int base) {
  102c60:	f3 0f 1e fb          	endbr32 
  102c64:	55                   	push   %ebp
  102c65:	89 e5                	mov    %esp,%ebp
  102c67:	83 ec 10             	sub    $0x10,%esp
    int neg = 0;
  102c6a:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    long val = 0;
  102c71:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t') {
  102c78:	eb 03                	jmp    102c7d <strtol+0x1d>
        s ++;
  102c7a:	ff 45 08             	incl   0x8(%ebp)
    while (*s == ' ' || *s == '\t') {
  102c7d:	8b 45 08             	mov    0x8(%ebp),%eax
  102c80:	0f b6 00             	movzbl (%eax),%eax
  102c83:	3c 20                	cmp    $0x20,%al
  102c85:	74 f3                	je     102c7a <strtol+0x1a>
  102c87:	8b 45 08             	mov    0x8(%ebp),%eax
  102c8a:	0f b6 00             	movzbl (%eax),%eax
  102c8d:	3c 09                	cmp    $0x9,%al
  102c8f:	74 e9                	je     102c7a <strtol+0x1a>
    }

    // plus/minus sign
    if (*s == '+') {
  102c91:	8b 45 08             	mov    0x8(%ebp),%eax
  102c94:	0f b6 00             	movzbl (%eax),%eax
  102c97:	3c 2b                	cmp    $0x2b,%al
  102c99:	75 05                	jne    102ca0 <strtol+0x40>
        s ++;
  102c9b:	ff 45 08             	incl   0x8(%ebp)
  102c9e:	eb 14                	jmp    102cb4 <strtol+0x54>
    }
    else if (*s == '-') {
  102ca0:	8b 45 08             	mov    0x8(%ebp),%eax
  102ca3:	0f b6 00             	movzbl (%eax),%eax
  102ca6:	3c 2d                	cmp    $0x2d,%al
  102ca8:	75 0a                	jne    102cb4 <strtol+0x54>
        s ++, neg = 1;
  102caa:	ff 45 08             	incl   0x8(%ebp)
  102cad:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%ebp)
    }

    // hex or octal base prefix
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x')) {
  102cb4:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102cb8:	74 06                	je     102cc0 <strtol+0x60>
  102cba:	83 7d 10 10          	cmpl   $0x10,0x10(%ebp)
  102cbe:	75 22                	jne    102ce2 <strtol+0x82>
  102cc0:	8b 45 08             	mov    0x8(%ebp),%eax
  102cc3:	0f b6 00             	movzbl (%eax),%eax
  102cc6:	3c 30                	cmp    $0x30,%al
  102cc8:	75 18                	jne    102ce2 <strtol+0x82>
  102cca:	8b 45 08             	mov    0x8(%ebp),%eax
  102ccd:	40                   	inc    %eax
  102cce:	0f b6 00             	movzbl (%eax),%eax
  102cd1:	3c 78                	cmp    $0x78,%al
  102cd3:	75 0d                	jne    102ce2 <strtol+0x82>
        s += 2, base = 16;
  102cd5:	83 45 08 02          	addl   $0x2,0x8(%ebp)
  102cd9:	c7 45 10 10 00 00 00 	movl   $0x10,0x10(%ebp)
  102ce0:	eb 29                	jmp    102d0b <strtol+0xab>
    }
    else if (base == 0 && s[0] == '0') {
  102ce2:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102ce6:	75 16                	jne    102cfe <strtol+0x9e>
  102ce8:	8b 45 08             	mov    0x8(%ebp),%eax
  102ceb:	0f b6 00             	movzbl (%eax),%eax
  102cee:	3c 30                	cmp    $0x30,%al
  102cf0:	75 0c                	jne    102cfe <strtol+0x9e>
        s ++, base = 8;
  102cf2:	ff 45 08             	incl   0x8(%ebp)
  102cf5:	c7 45 10 08 00 00 00 	movl   $0x8,0x10(%ebp)
  102cfc:	eb 0d                	jmp    102d0b <strtol+0xab>
    }
    else if (base == 0) {
  102cfe:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102d02:	75 07                	jne    102d0b <strtol+0xab>
        base = 10;
  102d04:	c7 45 10 0a 00 00 00 	movl   $0xa,0x10(%ebp)

    // digits
    while (1) {
        int dig;

        if (*s >= '0' && *s <= '9') {
  102d0b:	8b 45 08             	mov    0x8(%ebp),%eax
  102d0e:	0f b6 00             	movzbl (%eax),%eax
  102d11:	3c 2f                	cmp    $0x2f,%al
  102d13:	7e 1b                	jle    102d30 <strtol+0xd0>
  102d15:	8b 45 08             	mov    0x8(%ebp),%eax
  102d18:	0f b6 00             	movzbl (%eax),%eax
  102d1b:	3c 39                	cmp    $0x39,%al
  102d1d:	7f 11                	jg     102d30 <strtol+0xd0>
            dig = *s - '0';
  102d1f:	8b 45 08             	mov    0x8(%ebp),%eax
  102d22:	0f b6 00             	movzbl (%eax),%eax
  102d25:	0f be c0             	movsbl %al,%eax
  102d28:	83 e8 30             	sub    $0x30,%eax
  102d2b:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102d2e:	eb 48                	jmp    102d78 <strtol+0x118>
        }
        else if (*s >= 'a' && *s <= 'z') {
  102d30:	8b 45 08             	mov    0x8(%ebp),%eax
  102d33:	0f b6 00             	movzbl (%eax),%eax
  102d36:	3c 60                	cmp    $0x60,%al
  102d38:	7e 1b                	jle    102d55 <strtol+0xf5>
  102d3a:	8b 45 08             	mov    0x8(%ebp),%eax
  102d3d:	0f b6 00             	movzbl (%eax),%eax
  102d40:	3c 7a                	cmp    $0x7a,%al
  102d42:	7f 11                	jg     102d55 <strtol+0xf5>
            dig = *s - 'a' + 10;
  102d44:	8b 45 08             	mov    0x8(%ebp),%eax
  102d47:	0f b6 00             	movzbl (%eax),%eax
  102d4a:	0f be c0             	movsbl %al,%eax
  102d4d:	83 e8 57             	sub    $0x57,%eax
  102d50:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102d53:	eb 23                	jmp    102d78 <strtol+0x118>
        }
        else if (*s >= 'A' && *s <= 'Z') {
  102d55:	8b 45 08             	mov    0x8(%ebp),%eax
  102d58:	0f b6 00             	movzbl (%eax),%eax
  102d5b:	3c 40                	cmp    $0x40,%al
  102d5d:	7e 3b                	jle    102d9a <strtol+0x13a>
  102d5f:	8b 45 08             	mov    0x8(%ebp),%eax
  102d62:	0f b6 00             	movzbl (%eax),%eax
  102d65:	3c 5a                	cmp    $0x5a,%al
  102d67:	7f 31                	jg     102d9a <strtol+0x13a>
            dig = *s - 'A' + 10;
  102d69:	8b 45 08             	mov    0x8(%ebp),%eax
  102d6c:	0f b6 00             	movzbl (%eax),%eax
  102d6f:	0f be c0             	movsbl %al,%eax
  102d72:	83 e8 37             	sub    $0x37,%eax
  102d75:	89 45 f4             	mov    %eax,-0xc(%ebp)
        }
        else {
            break;
        }
        if (dig >= base) {
  102d78:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102d7b:	3b 45 10             	cmp    0x10(%ebp),%eax
  102d7e:	7d 19                	jge    102d99 <strtol+0x139>
            break;
        }
        s ++, val = (val * base) + dig;
  102d80:	ff 45 08             	incl   0x8(%ebp)
  102d83:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102d86:	0f af 45 10          	imul   0x10(%ebp),%eax
  102d8a:	89 c2                	mov    %eax,%edx
  102d8c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102d8f:	01 d0                	add    %edx,%eax
  102d91:	89 45 f8             	mov    %eax,-0x8(%ebp)
    while (1) {
  102d94:	e9 72 ff ff ff       	jmp    102d0b <strtol+0xab>
            break;
  102d99:	90                   	nop
        // we don't properly detect overflow!
    }

    if (endptr) {
  102d9a:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  102d9e:	74 08                	je     102da8 <strtol+0x148>
        *endptr = (char *) s;
  102da0:	8b 45 0c             	mov    0xc(%ebp),%eax
  102da3:	8b 55 08             	mov    0x8(%ebp),%edx
  102da6:	89 10                	mov    %edx,(%eax)
    }
    return (neg ? -val : val);
  102da8:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
  102dac:	74 07                	je     102db5 <strtol+0x155>
  102dae:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102db1:	f7 d8                	neg    %eax
  102db3:	eb 03                	jmp    102db8 <strtol+0x158>
  102db5:	8b 45 f8             	mov    -0x8(%ebp),%eax
}
  102db8:	c9                   	leave  
  102db9:	c3                   	ret    

00102dba <memset>:
 * @n:        number of bytes to be set to the value
 *
 * The memset() function returns @s.
 * */
void *
memset(void *s, char c, size_t n) {
  102dba:	f3 0f 1e fb          	endbr32 
  102dbe:	55                   	push   %ebp
  102dbf:	89 e5                	mov    %esp,%ebp
  102dc1:	57                   	push   %edi
  102dc2:	83 ec 24             	sub    $0x24,%esp
  102dc5:	8b 45 0c             	mov    0xc(%ebp),%eax
  102dc8:	88 45 d8             	mov    %al,-0x28(%ebp)
#ifdef __HAVE_ARCH_MEMSET
    return __memset(s, c, n);
  102dcb:	0f be 55 d8          	movsbl -0x28(%ebp),%edx
  102dcf:	8b 45 08             	mov    0x8(%ebp),%eax
  102dd2:	89 45 f8             	mov    %eax,-0x8(%ebp)
  102dd5:	88 55 f7             	mov    %dl,-0x9(%ebp)
  102dd8:	8b 45 10             	mov    0x10(%ebp),%eax
  102ddb:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_MEMSET
#define __HAVE_ARCH_MEMSET
static inline void *
__memset(void *s, char c, size_t n) {
    int d0, d1;
    asm volatile (
  102dde:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  102de1:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
  102de5:	8b 55 f8             	mov    -0x8(%ebp),%edx
  102de8:	89 d7                	mov    %edx,%edi
  102dea:	f3 aa                	rep stos %al,%es:(%edi)
  102dec:	89 fa                	mov    %edi,%edx
  102dee:	89 4d ec             	mov    %ecx,-0x14(%ebp)
  102df1:	89 55 e8             	mov    %edx,-0x18(%ebp)
            "rep; stosb;"
            : "=&c" (d0), "=&D" (d1)
            : "0" (n), "a" (c), "1" (s)
            : "memory");
    return s;
  102df4:	8b 45 f8             	mov    -0x8(%ebp),%eax
    while (n -- > 0) {
        *p ++ = c;
    }
    return s;
#endif /* __HAVE_ARCH_MEMSET */
}
  102df7:	83 c4 24             	add    $0x24,%esp
  102dfa:	5f                   	pop    %edi
  102dfb:	5d                   	pop    %ebp
  102dfc:	c3                   	ret    

00102dfd <memmove>:
 * @n:        number of bytes to copy
 *
 * The memmove() function returns @dst.
 * */
void *
memmove(void *dst, const void *src, size_t n) {
  102dfd:	f3 0f 1e fb          	endbr32 
  102e01:	55                   	push   %ebp
  102e02:	89 e5                	mov    %esp,%ebp
  102e04:	57                   	push   %edi
  102e05:	56                   	push   %esi
  102e06:	53                   	push   %ebx
  102e07:	83 ec 30             	sub    $0x30,%esp
  102e0a:	8b 45 08             	mov    0x8(%ebp),%eax
  102e0d:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102e10:	8b 45 0c             	mov    0xc(%ebp),%eax
  102e13:	89 45 ec             	mov    %eax,-0x14(%ebp)
  102e16:	8b 45 10             	mov    0x10(%ebp),%eax
  102e19:	89 45 e8             	mov    %eax,-0x18(%ebp)

#ifndef __HAVE_ARCH_MEMMOVE
#define __HAVE_ARCH_MEMMOVE
static inline void *
__memmove(void *dst, const void *src, size_t n) {
    if (dst < src) {
  102e1c:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102e1f:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  102e22:	73 42                	jae    102e66 <memmove+0x69>
  102e24:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102e27:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  102e2a:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102e2d:	89 45 e0             	mov    %eax,-0x20(%ebp)
  102e30:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102e33:	89 45 dc             	mov    %eax,-0x24(%ebp)
            "andl $3, %%ecx;"
            "jz 1f;"
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
  102e36:	8b 45 dc             	mov    -0x24(%ebp),%eax
  102e39:	c1 e8 02             	shr    $0x2,%eax
  102e3c:	89 c1                	mov    %eax,%ecx
    asm volatile (
  102e3e:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  102e41:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102e44:	89 d7                	mov    %edx,%edi
  102e46:	89 c6                	mov    %eax,%esi
  102e48:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  102e4a:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  102e4d:	83 e1 03             	and    $0x3,%ecx
  102e50:	74 02                	je     102e54 <memmove+0x57>
  102e52:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  102e54:	89 f0                	mov    %esi,%eax
  102e56:	89 fa                	mov    %edi,%edx
  102e58:	89 4d d8             	mov    %ecx,-0x28(%ebp)
  102e5b:	89 55 d4             	mov    %edx,-0x2c(%ebp)
  102e5e:	89 45 d0             	mov    %eax,-0x30(%ebp)
            : "memory");
    return dst;
  102e61:	8b 45 e4             	mov    -0x1c(%ebp),%eax
        return __memcpy(dst, src, n);
  102e64:	eb 36                	jmp    102e9c <memmove+0x9f>
            : "0" (n), "1" (n - 1 + src), "2" (n - 1 + dst)
  102e66:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102e69:	8d 50 ff             	lea    -0x1(%eax),%edx
  102e6c:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102e6f:	01 c2                	add    %eax,%edx
  102e71:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102e74:	8d 48 ff             	lea    -0x1(%eax),%ecx
  102e77:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102e7a:	8d 1c 01             	lea    (%ecx,%eax,1),%ebx
    asm volatile (
  102e7d:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102e80:	89 c1                	mov    %eax,%ecx
  102e82:	89 d8                	mov    %ebx,%eax
  102e84:	89 d6                	mov    %edx,%esi
  102e86:	89 c7                	mov    %eax,%edi
  102e88:	fd                   	std    
  102e89:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  102e8b:	fc                   	cld    
  102e8c:	89 f8                	mov    %edi,%eax
  102e8e:	89 f2                	mov    %esi,%edx
  102e90:	89 4d cc             	mov    %ecx,-0x34(%ebp)
  102e93:	89 55 c8             	mov    %edx,-0x38(%ebp)
  102e96:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    return dst;
  102e99:	8b 45 f0             	mov    -0x10(%ebp),%eax
            *d ++ = *s ++;
        }
    }
    return dst;
#endif /* __HAVE_ARCH_MEMMOVE */
}
  102e9c:	83 c4 30             	add    $0x30,%esp
  102e9f:	5b                   	pop    %ebx
  102ea0:	5e                   	pop    %esi
  102ea1:	5f                   	pop    %edi
  102ea2:	5d                   	pop    %ebp
  102ea3:	c3                   	ret    

00102ea4 <memcpy>:
 * it always copies exactly @n bytes. To avoid overflows, the size of arrays pointed
 * by both @src and @dst, should be at least @n bytes, and should not overlap
 * (for overlapping memory area, memmove is a safer approach).
 * */
void *
memcpy(void *dst, const void *src, size_t n) {
  102ea4:	f3 0f 1e fb          	endbr32 
  102ea8:	55                   	push   %ebp
  102ea9:	89 e5                	mov    %esp,%ebp
  102eab:	57                   	push   %edi
  102eac:	56                   	push   %esi
  102ead:	83 ec 20             	sub    $0x20,%esp
  102eb0:	8b 45 08             	mov    0x8(%ebp),%eax
  102eb3:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102eb6:	8b 45 0c             	mov    0xc(%ebp),%eax
  102eb9:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102ebc:	8b 45 10             	mov    0x10(%ebp),%eax
  102ebf:	89 45 ec             	mov    %eax,-0x14(%ebp)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
  102ec2:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102ec5:	c1 e8 02             	shr    $0x2,%eax
  102ec8:	89 c1                	mov    %eax,%ecx
    asm volatile (
  102eca:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102ecd:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102ed0:	89 d7                	mov    %edx,%edi
  102ed2:	89 c6                	mov    %eax,%esi
  102ed4:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  102ed6:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  102ed9:	83 e1 03             	and    $0x3,%ecx
  102edc:	74 02                	je     102ee0 <memcpy+0x3c>
  102ede:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  102ee0:	89 f0                	mov    %esi,%eax
  102ee2:	89 fa                	mov    %edi,%edx
  102ee4:	89 4d e8             	mov    %ecx,-0x18(%ebp)
  102ee7:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  102eea:	89 45 e0             	mov    %eax,-0x20(%ebp)
    return dst;
  102eed:	8b 45 f4             	mov    -0xc(%ebp),%eax
    while (n -- > 0) {
        *d ++ = *s ++;
    }
    return dst;
#endif /* __HAVE_ARCH_MEMCPY */
}
  102ef0:	83 c4 20             	add    $0x20,%esp
  102ef3:	5e                   	pop    %esi
  102ef4:	5f                   	pop    %edi
  102ef5:	5d                   	pop    %ebp
  102ef6:	c3                   	ret    

00102ef7 <memcmp>:
 *   match in both memory blocks has a greater value in @v1 than in @v2
 *   as if evaluated as unsigned char values;
 * - And a value less than zero indicates the opposite.
 * */
int
memcmp(const void *v1, const void *v2, size_t n) {
  102ef7:	f3 0f 1e fb          	endbr32 
  102efb:	55                   	push   %ebp
  102efc:	89 e5                	mov    %esp,%ebp
  102efe:	83 ec 10             	sub    $0x10,%esp
    const char *s1 = (const char *)v1;
  102f01:	8b 45 08             	mov    0x8(%ebp),%eax
  102f04:	89 45 fc             	mov    %eax,-0x4(%ebp)
    const char *s2 = (const char *)v2;
  102f07:	8b 45 0c             	mov    0xc(%ebp),%eax
  102f0a:	89 45 f8             	mov    %eax,-0x8(%ebp)
    while (n -- > 0) {
  102f0d:	eb 2e                	jmp    102f3d <memcmp+0x46>
        if (*s1 != *s2) {
  102f0f:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102f12:	0f b6 10             	movzbl (%eax),%edx
  102f15:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102f18:	0f b6 00             	movzbl (%eax),%eax
  102f1b:	38 c2                	cmp    %al,%dl
  102f1d:	74 18                	je     102f37 <memcmp+0x40>
            return (int)((unsigned char)*s1 - (unsigned char)*s2);
  102f1f:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102f22:	0f b6 00             	movzbl (%eax),%eax
  102f25:	0f b6 d0             	movzbl %al,%edx
  102f28:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102f2b:	0f b6 00             	movzbl (%eax),%eax
  102f2e:	0f b6 c0             	movzbl %al,%eax
  102f31:	29 c2                	sub    %eax,%edx
  102f33:	89 d0                	mov    %edx,%eax
  102f35:	eb 18                	jmp    102f4f <memcmp+0x58>
        }
        s1 ++, s2 ++;
  102f37:	ff 45 fc             	incl   -0x4(%ebp)
  102f3a:	ff 45 f8             	incl   -0x8(%ebp)
    while (n -- > 0) {
  102f3d:	8b 45 10             	mov    0x10(%ebp),%eax
  102f40:	8d 50 ff             	lea    -0x1(%eax),%edx
  102f43:	89 55 10             	mov    %edx,0x10(%ebp)
  102f46:	85 c0                	test   %eax,%eax
  102f48:	75 c5                	jne    102f0f <memcmp+0x18>
    }
    return 0;
  102f4a:	b8 00 00 00 00       	mov    $0x0,%eax
}
  102f4f:	c9                   	leave  
  102f50:	c3                   	ret    

00102f51 <printnum>:
 * @width:         maximum number of digits, if the actual width is less than @width, use @padc instead
 * @padc:        character that padded on the left if the actual width is less than @width
 * */
static void
printnum(void (*putch)(int, void*), void *putdat,
        unsigned long long num, unsigned base, int width, int padc) {
  102f51:	f3 0f 1e fb          	endbr32 
  102f55:	55                   	push   %ebp
  102f56:	89 e5                	mov    %esp,%ebp
  102f58:	83 ec 58             	sub    $0x58,%esp
  102f5b:	8b 45 10             	mov    0x10(%ebp),%eax
  102f5e:	89 45 d0             	mov    %eax,-0x30(%ebp)
  102f61:	8b 45 14             	mov    0x14(%ebp),%eax
  102f64:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    unsigned long long result = num;
  102f67:	8b 45 d0             	mov    -0x30(%ebp),%eax
  102f6a:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  102f6d:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102f70:	89 55 ec             	mov    %edx,-0x14(%ebp)
    unsigned mod = do_div(result, base);
  102f73:	8b 45 18             	mov    0x18(%ebp),%eax
  102f76:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  102f79:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102f7c:	8b 55 ec             	mov    -0x14(%ebp),%edx
  102f7f:	89 45 e0             	mov    %eax,-0x20(%ebp)
  102f82:	89 55 f0             	mov    %edx,-0x10(%ebp)
  102f85:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102f88:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102f8b:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  102f8f:	74 1c                	je     102fad <printnum+0x5c>
  102f91:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102f94:	ba 00 00 00 00       	mov    $0x0,%edx
  102f99:	f7 75 e4             	divl   -0x1c(%ebp)
  102f9c:	89 55 f4             	mov    %edx,-0xc(%ebp)
  102f9f:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102fa2:	ba 00 00 00 00       	mov    $0x0,%edx
  102fa7:	f7 75 e4             	divl   -0x1c(%ebp)
  102faa:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102fad:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102fb0:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102fb3:	f7 75 e4             	divl   -0x1c(%ebp)
  102fb6:	89 45 e0             	mov    %eax,-0x20(%ebp)
  102fb9:	89 55 dc             	mov    %edx,-0x24(%ebp)
  102fbc:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102fbf:	8b 55 f0             	mov    -0x10(%ebp),%edx
  102fc2:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102fc5:	89 55 ec             	mov    %edx,-0x14(%ebp)
  102fc8:	8b 45 dc             	mov    -0x24(%ebp),%eax
  102fcb:	89 45 d8             	mov    %eax,-0x28(%ebp)

    // first recursively print all preceding (more significant) digits
    if (num >= base) {
  102fce:	8b 45 18             	mov    0x18(%ebp),%eax
  102fd1:	ba 00 00 00 00       	mov    $0x0,%edx
  102fd6:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
  102fd9:	39 45 d0             	cmp    %eax,-0x30(%ebp)
  102fdc:	19 d1                	sbb    %edx,%ecx
  102fde:	72 4c                	jb     10302c <printnum+0xdb>
        printnum(putch, putdat, result, base, width - 1, padc);
  102fe0:	8b 45 1c             	mov    0x1c(%ebp),%eax
  102fe3:	8d 50 ff             	lea    -0x1(%eax),%edx
  102fe6:	8b 45 20             	mov    0x20(%ebp),%eax
  102fe9:	89 44 24 18          	mov    %eax,0x18(%esp)
  102fed:	89 54 24 14          	mov    %edx,0x14(%esp)
  102ff1:	8b 45 18             	mov    0x18(%ebp),%eax
  102ff4:	89 44 24 10          	mov    %eax,0x10(%esp)
  102ff8:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102ffb:	8b 55 ec             	mov    -0x14(%ebp),%edx
  102ffe:	89 44 24 08          	mov    %eax,0x8(%esp)
  103002:	89 54 24 0c          	mov    %edx,0xc(%esp)
  103006:	8b 45 0c             	mov    0xc(%ebp),%eax
  103009:	89 44 24 04          	mov    %eax,0x4(%esp)
  10300d:	8b 45 08             	mov    0x8(%ebp),%eax
  103010:	89 04 24             	mov    %eax,(%esp)
  103013:	e8 39 ff ff ff       	call   102f51 <printnum>
  103018:	eb 1b                	jmp    103035 <printnum+0xe4>
    } else {
        // print any needed pad characters before first digit
        while (-- width > 0)
            putch(padc, putdat);
  10301a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10301d:	89 44 24 04          	mov    %eax,0x4(%esp)
  103021:	8b 45 20             	mov    0x20(%ebp),%eax
  103024:	89 04 24             	mov    %eax,(%esp)
  103027:	8b 45 08             	mov    0x8(%ebp),%eax
  10302a:	ff d0                	call   *%eax
        while (-- width > 0)
  10302c:	ff 4d 1c             	decl   0x1c(%ebp)
  10302f:	83 7d 1c 00          	cmpl   $0x0,0x1c(%ebp)
  103033:	7f e5                	jg     10301a <printnum+0xc9>
    }
    // then print this (the least significant) digit
    putch("0123456789abcdef"[mod], putdat);
  103035:	8b 45 d8             	mov    -0x28(%ebp),%eax
  103038:	05 70 3d 10 00       	add    $0x103d70,%eax
  10303d:	0f b6 00             	movzbl (%eax),%eax
  103040:	0f be c0             	movsbl %al,%eax
  103043:	8b 55 0c             	mov    0xc(%ebp),%edx
  103046:	89 54 24 04          	mov    %edx,0x4(%esp)
  10304a:	89 04 24             	mov    %eax,(%esp)
  10304d:	8b 45 08             	mov    0x8(%ebp),%eax
  103050:	ff d0                	call   *%eax
}
  103052:	90                   	nop
  103053:	c9                   	leave  
  103054:	c3                   	ret    

00103055 <getuint>:
 * getuint - get an unsigned int of various possible sizes from a varargs list
 * @ap:            a varargs list pointer
 * @lflag:        determines the size of the vararg that @ap points to
 * */
static unsigned long long
getuint(va_list *ap, int lflag) {
  103055:	f3 0f 1e fb          	endbr32 
  103059:	55                   	push   %ebp
  10305a:	89 e5                	mov    %esp,%ebp
    if (lflag >= 2) {
  10305c:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  103060:	7e 14                	jle    103076 <getuint+0x21>
        return va_arg(*ap, unsigned long long);
  103062:	8b 45 08             	mov    0x8(%ebp),%eax
  103065:	8b 00                	mov    (%eax),%eax
  103067:	8d 48 08             	lea    0x8(%eax),%ecx
  10306a:	8b 55 08             	mov    0x8(%ebp),%edx
  10306d:	89 0a                	mov    %ecx,(%edx)
  10306f:	8b 50 04             	mov    0x4(%eax),%edx
  103072:	8b 00                	mov    (%eax),%eax
  103074:	eb 30                	jmp    1030a6 <getuint+0x51>
    }
    else if (lflag) {
  103076:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  10307a:	74 16                	je     103092 <getuint+0x3d>
        return va_arg(*ap, unsigned long);
  10307c:	8b 45 08             	mov    0x8(%ebp),%eax
  10307f:	8b 00                	mov    (%eax),%eax
  103081:	8d 48 04             	lea    0x4(%eax),%ecx
  103084:	8b 55 08             	mov    0x8(%ebp),%edx
  103087:	89 0a                	mov    %ecx,(%edx)
  103089:	8b 00                	mov    (%eax),%eax
  10308b:	ba 00 00 00 00       	mov    $0x0,%edx
  103090:	eb 14                	jmp    1030a6 <getuint+0x51>
    }
    else {
        return va_arg(*ap, unsigned int);
  103092:	8b 45 08             	mov    0x8(%ebp),%eax
  103095:	8b 00                	mov    (%eax),%eax
  103097:	8d 48 04             	lea    0x4(%eax),%ecx
  10309a:	8b 55 08             	mov    0x8(%ebp),%edx
  10309d:	89 0a                	mov    %ecx,(%edx)
  10309f:	8b 00                	mov    (%eax),%eax
  1030a1:	ba 00 00 00 00       	mov    $0x0,%edx
    }
}
  1030a6:	5d                   	pop    %ebp
  1030a7:	c3                   	ret    

001030a8 <getint>:
 * getint - same as getuint but signed, we can't use getuint because of sign extension
 * @ap:            a varargs list pointer
 * @lflag:        determines the size of the vararg that @ap points to
 * */
static long long
getint(va_list *ap, int lflag) {
  1030a8:	f3 0f 1e fb          	endbr32 
  1030ac:	55                   	push   %ebp
  1030ad:	89 e5                	mov    %esp,%ebp
    if (lflag >= 2) {
  1030af:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  1030b3:	7e 14                	jle    1030c9 <getint+0x21>
        return va_arg(*ap, long long);
  1030b5:	8b 45 08             	mov    0x8(%ebp),%eax
  1030b8:	8b 00                	mov    (%eax),%eax
  1030ba:	8d 48 08             	lea    0x8(%eax),%ecx
  1030bd:	8b 55 08             	mov    0x8(%ebp),%edx
  1030c0:	89 0a                	mov    %ecx,(%edx)
  1030c2:	8b 50 04             	mov    0x4(%eax),%edx
  1030c5:	8b 00                	mov    (%eax),%eax
  1030c7:	eb 28                	jmp    1030f1 <getint+0x49>
    }
    else if (lflag) {
  1030c9:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  1030cd:	74 12                	je     1030e1 <getint+0x39>
        return va_arg(*ap, long);
  1030cf:	8b 45 08             	mov    0x8(%ebp),%eax
  1030d2:	8b 00                	mov    (%eax),%eax
  1030d4:	8d 48 04             	lea    0x4(%eax),%ecx
  1030d7:	8b 55 08             	mov    0x8(%ebp),%edx
  1030da:	89 0a                	mov    %ecx,(%edx)
  1030dc:	8b 00                	mov    (%eax),%eax
  1030de:	99                   	cltd   
  1030df:	eb 10                	jmp    1030f1 <getint+0x49>
    }
    else {
        return va_arg(*ap, int);
  1030e1:	8b 45 08             	mov    0x8(%ebp),%eax
  1030e4:	8b 00                	mov    (%eax),%eax
  1030e6:	8d 48 04             	lea    0x4(%eax),%ecx
  1030e9:	8b 55 08             	mov    0x8(%ebp),%edx
  1030ec:	89 0a                	mov    %ecx,(%edx)
  1030ee:	8b 00                	mov    (%eax),%eax
  1030f0:	99                   	cltd   
    }
}
  1030f1:	5d                   	pop    %ebp
  1030f2:	c3                   	ret    

001030f3 <printfmt>:
 * @putch:        specified putch function, print a single character
 * @putdat:        used by @putch function
 * @fmt:        the format string to use
 * */
void
printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...) {
  1030f3:	f3 0f 1e fb          	endbr32 
  1030f7:	55                   	push   %ebp
  1030f8:	89 e5                	mov    %esp,%ebp
  1030fa:	83 ec 28             	sub    $0x28,%esp
    va_list ap;

    va_start(ap, fmt);
  1030fd:	8d 45 14             	lea    0x14(%ebp),%eax
  103100:	89 45 f4             	mov    %eax,-0xc(%ebp)
    vprintfmt(putch, putdat, fmt, ap);
  103103:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103106:	89 44 24 0c          	mov    %eax,0xc(%esp)
  10310a:	8b 45 10             	mov    0x10(%ebp),%eax
  10310d:	89 44 24 08          	mov    %eax,0x8(%esp)
  103111:	8b 45 0c             	mov    0xc(%ebp),%eax
  103114:	89 44 24 04          	mov    %eax,0x4(%esp)
  103118:	8b 45 08             	mov    0x8(%ebp),%eax
  10311b:	89 04 24             	mov    %eax,(%esp)
  10311e:	e8 03 00 00 00       	call   103126 <vprintfmt>
    va_end(ap);
}
  103123:	90                   	nop
  103124:	c9                   	leave  
  103125:	c3                   	ret    

00103126 <vprintfmt>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want printfmt() instead.
 * */
void
vprintfmt(void (*putch)(int, void*), void *putdat, const char *fmt, va_list ap) {
  103126:	f3 0f 1e fb          	endbr32 
  10312a:	55                   	push   %ebp
  10312b:	89 e5                	mov    %esp,%ebp
  10312d:	56                   	push   %esi
  10312e:	53                   	push   %ebx
  10312f:	83 ec 40             	sub    $0x40,%esp
    register int ch, err;
    unsigned long long num;
    int base, width, precision, lflag, altflag;

    while (1) {
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  103132:	eb 17                	jmp    10314b <vprintfmt+0x25>
            if (ch == '\0') {
  103134:	85 db                	test   %ebx,%ebx
  103136:	0f 84 c0 03 00 00    	je     1034fc <vprintfmt+0x3d6>
                return;
            }
            putch(ch, putdat);
  10313c:	8b 45 0c             	mov    0xc(%ebp),%eax
  10313f:	89 44 24 04          	mov    %eax,0x4(%esp)
  103143:	89 1c 24             	mov    %ebx,(%esp)
  103146:	8b 45 08             	mov    0x8(%ebp),%eax
  103149:	ff d0                	call   *%eax
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  10314b:	8b 45 10             	mov    0x10(%ebp),%eax
  10314e:	8d 50 01             	lea    0x1(%eax),%edx
  103151:	89 55 10             	mov    %edx,0x10(%ebp)
  103154:	0f b6 00             	movzbl (%eax),%eax
  103157:	0f b6 d8             	movzbl %al,%ebx
  10315a:	83 fb 25             	cmp    $0x25,%ebx
  10315d:	75 d5                	jne    103134 <vprintfmt+0xe>
        }

        // Process a %-escape sequence
        char padc = ' ';
  10315f:	c6 45 db 20          	movb   $0x20,-0x25(%ebp)
        width = precision = -1;
  103163:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
  10316a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  10316d:	89 45 e8             	mov    %eax,-0x18(%ebp)
        lflag = altflag = 0;
  103170:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  103177:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10317a:	89 45 e0             	mov    %eax,-0x20(%ebp)

    reswitch:
        switch (ch = *(unsigned char *)fmt ++) {
  10317d:	8b 45 10             	mov    0x10(%ebp),%eax
  103180:	8d 50 01             	lea    0x1(%eax),%edx
  103183:	89 55 10             	mov    %edx,0x10(%ebp)
  103186:	0f b6 00             	movzbl (%eax),%eax
  103189:	0f b6 d8             	movzbl %al,%ebx
  10318c:	8d 43 dd             	lea    -0x23(%ebx),%eax
  10318f:	83 f8 55             	cmp    $0x55,%eax
  103192:	0f 87 38 03 00 00    	ja     1034d0 <vprintfmt+0x3aa>
  103198:	8b 04 85 94 3d 10 00 	mov    0x103d94(,%eax,4),%eax
  10319f:	3e ff e0             	notrack jmp *%eax

        // flag to pad on the right
        case '-':
            padc = '-';
  1031a2:	c6 45 db 2d          	movb   $0x2d,-0x25(%ebp)
            goto reswitch;
  1031a6:	eb d5                	jmp    10317d <vprintfmt+0x57>

        // flag to pad with 0's instead of spaces
        case '0':
            padc = '0';
  1031a8:	c6 45 db 30          	movb   $0x30,-0x25(%ebp)
            goto reswitch;
  1031ac:	eb cf                	jmp    10317d <vprintfmt+0x57>

        // width field
        case '1' ... '9':
            for (precision = 0; ; ++ fmt) {
  1031ae:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
                precision = precision * 10 + ch - '0';
  1031b5:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  1031b8:	89 d0                	mov    %edx,%eax
  1031ba:	c1 e0 02             	shl    $0x2,%eax
  1031bd:	01 d0                	add    %edx,%eax
  1031bf:	01 c0                	add    %eax,%eax
  1031c1:	01 d8                	add    %ebx,%eax
  1031c3:	83 e8 30             	sub    $0x30,%eax
  1031c6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
                ch = *fmt;
  1031c9:	8b 45 10             	mov    0x10(%ebp),%eax
  1031cc:	0f b6 00             	movzbl (%eax),%eax
  1031cf:	0f be d8             	movsbl %al,%ebx
                if (ch < '0' || ch > '9') {
  1031d2:	83 fb 2f             	cmp    $0x2f,%ebx
  1031d5:	7e 38                	jle    10320f <vprintfmt+0xe9>
  1031d7:	83 fb 39             	cmp    $0x39,%ebx
  1031da:	7f 33                	jg     10320f <vprintfmt+0xe9>
            for (precision = 0; ; ++ fmt) {
  1031dc:	ff 45 10             	incl   0x10(%ebp)
                precision = precision * 10 + ch - '0';
  1031df:	eb d4                	jmp    1031b5 <vprintfmt+0x8f>
                }
            }
            goto process_precision;

        case '*':
            precision = va_arg(ap, int);
  1031e1:	8b 45 14             	mov    0x14(%ebp),%eax
  1031e4:	8d 50 04             	lea    0x4(%eax),%edx
  1031e7:	89 55 14             	mov    %edx,0x14(%ebp)
  1031ea:	8b 00                	mov    (%eax),%eax
  1031ec:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            goto process_precision;
  1031ef:	eb 1f                	jmp    103210 <vprintfmt+0xea>

        case '.':
            if (width < 0)
  1031f1:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  1031f5:	79 86                	jns    10317d <vprintfmt+0x57>
                width = 0;
  1031f7:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
            goto reswitch;
  1031fe:	e9 7a ff ff ff       	jmp    10317d <vprintfmt+0x57>

        case '#':
            altflag = 1;
  103203:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%ebp)
            goto reswitch;
  10320a:	e9 6e ff ff ff       	jmp    10317d <vprintfmt+0x57>
            goto process_precision;
  10320f:	90                   	nop

        process_precision:
            if (width < 0)
  103210:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  103214:	0f 89 63 ff ff ff    	jns    10317d <vprintfmt+0x57>
                width = precision, precision = -1;
  10321a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  10321d:	89 45 e8             	mov    %eax,-0x18(%ebp)
  103220:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
            goto reswitch;
  103227:	e9 51 ff ff ff       	jmp    10317d <vprintfmt+0x57>

        // long flag (doubled for long long)
        case 'l':
            lflag ++;
  10322c:	ff 45 e0             	incl   -0x20(%ebp)
            goto reswitch;
  10322f:	e9 49 ff ff ff       	jmp    10317d <vprintfmt+0x57>

        // character
        case 'c':
            putch(va_arg(ap, int), putdat);
  103234:	8b 45 14             	mov    0x14(%ebp),%eax
  103237:	8d 50 04             	lea    0x4(%eax),%edx
  10323a:	89 55 14             	mov    %edx,0x14(%ebp)
  10323d:	8b 00                	mov    (%eax),%eax
  10323f:	8b 55 0c             	mov    0xc(%ebp),%edx
  103242:	89 54 24 04          	mov    %edx,0x4(%esp)
  103246:	89 04 24             	mov    %eax,(%esp)
  103249:	8b 45 08             	mov    0x8(%ebp),%eax
  10324c:	ff d0                	call   *%eax
            break;
  10324e:	e9 a4 02 00 00       	jmp    1034f7 <vprintfmt+0x3d1>

        // error message
        case 'e':
            err = va_arg(ap, int);
  103253:	8b 45 14             	mov    0x14(%ebp),%eax
  103256:	8d 50 04             	lea    0x4(%eax),%edx
  103259:	89 55 14             	mov    %edx,0x14(%ebp)
  10325c:	8b 18                	mov    (%eax),%ebx
            if (err < 0) {
  10325e:	85 db                	test   %ebx,%ebx
  103260:	79 02                	jns    103264 <vprintfmt+0x13e>
                err = -err;
  103262:	f7 db                	neg    %ebx
            }
            if (err > MAXERROR || (p = error_string[err]) == NULL) {
  103264:	83 fb 06             	cmp    $0x6,%ebx
  103267:	7f 0b                	jg     103274 <vprintfmt+0x14e>
  103269:	8b 34 9d 54 3d 10 00 	mov    0x103d54(,%ebx,4),%esi
  103270:	85 f6                	test   %esi,%esi
  103272:	75 23                	jne    103297 <vprintfmt+0x171>
                printfmt(putch, putdat, "error %d", err);
  103274:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
  103278:	c7 44 24 08 81 3d 10 	movl   $0x103d81,0x8(%esp)
  10327f:	00 
  103280:	8b 45 0c             	mov    0xc(%ebp),%eax
  103283:	89 44 24 04          	mov    %eax,0x4(%esp)
  103287:	8b 45 08             	mov    0x8(%ebp),%eax
  10328a:	89 04 24             	mov    %eax,(%esp)
  10328d:	e8 61 fe ff ff       	call   1030f3 <printfmt>
            }
            else {
                printfmt(putch, putdat, "%s", p);
            }
            break;
  103292:	e9 60 02 00 00       	jmp    1034f7 <vprintfmt+0x3d1>
                printfmt(putch, putdat, "%s", p);
  103297:	89 74 24 0c          	mov    %esi,0xc(%esp)
  10329b:	c7 44 24 08 8a 3d 10 	movl   $0x103d8a,0x8(%esp)
  1032a2:	00 
  1032a3:	8b 45 0c             	mov    0xc(%ebp),%eax
  1032a6:	89 44 24 04          	mov    %eax,0x4(%esp)
  1032aa:	8b 45 08             	mov    0x8(%ebp),%eax
  1032ad:	89 04 24             	mov    %eax,(%esp)
  1032b0:	e8 3e fe ff ff       	call   1030f3 <printfmt>
            break;
  1032b5:	e9 3d 02 00 00       	jmp    1034f7 <vprintfmt+0x3d1>

        // string
        case 's':
            if ((p = va_arg(ap, char *)) == NULL) {
  1032ba:	8b 45 14             	mov    0x14(%ebp),%eax
  1032bd:	8d 50 04             	lea    0x4(%eax),%edx
  1032c0:	89 55 14             	mov    %edx,0x14(%ebp)
  1032c3:	8b 30                	mov    (%eax),%esi
  1032c5:	85 f6                	test   %esi,%esi
  1032c7:	75 05                	jne    1032ce <vprintfmt+0x1a8>
                p = "(null)";
  1032c9:	be 8d 3d 10 00       	mov    $0x103d8d,%esi
            }
            if (width > 0 && padc != '-') {
  1032ce:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  1032d2:	7e 76                	jle    10334a <vprintfmt+0x224>
  1032d4:	80 7d db 2d          	cmpb   $0x2d,-0x25(%ebp)
  1032d8:	74 70                	je     10334a <vprintfmt+0x224>
                for (width -= strnlen(p, precision); width > 0; width --) {
  1032da:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1032dd:	89 44 24 04          	mov    %eax,0x4(%esp)
  1032e1:	89 34 24             	mov    %esi,(%esp)
  1032e4:	e8 ba f7 ff ff       	call   102aa3 <strnlen>
  1032e9:	8b 55 e8             	mov    -0x18(%ebp),%edx
  1032ec:	29 c2                	sub    %eax,%edx
  1032ee:	89 d0                	mov    %edx,%eax
  1032f0:	89 45 e8             	mov    %eax,-0x18(%ebp)
  1032f3:	eb 16                	jmp    10330b <vprintfmt+0x1e5>
                    putch(padc, putdat);
  1032f5:	0f be 45 db          	movsbl -0x25(%ebp),%eax
  1032f9:	8b 55 0c             	mov    0xc(%ebp),%edx
  1032fc:	89 54 24 04          	mov    %edx,0x4(%esp)
  103300:	89 04 24             	mov    %eax,(%esp)
  103303:	8b 45 08             	mov    0x8(%ebp),%eax
  103306:	ff d0                	call   *%eax
                for (width -= strnlen(p, precision); width > 0; width --) {
  103308:	ff 4d e8             	decl   -0x18(%ebp)
  10330b:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  10330f:	7f e4                	jg     1032f5 <vprintfmt+0x1cf>
                }
            }
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
  103311:	eb 37                	jmp    10334a <vprintfmt+0x224>
                if (altflag && (ch < ' ' || ch > '~')) {
  103313:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
  103317:	74 1f                	je     103338 <vprintfmt+0x212>
  103319:	83 fb 1f             	cmp    $0x1f,%ebx
  10331c:	7e 05                	jle    103323 <vprintfmt+0x1fd>
  10331e:	83 fb 7e             	cmp    $0x7e,%ebx
  103321:	7e 15                	jle    103338 <vprintfmt+0x212>
                    putch('?', putdat);
  103323:	8b 45 0c             	mov    0xc(%ebp),%eax
  103326:	89 44 24 04          	mov    %eax,0x4(%esp)
  10332a:	c7 04 24 3f 00 00 00 	movl   $0x3f,(%esp)
  103331:	8b 45 08             	mov    0x8(%ebp),%eax
  103334:	ff d0                	call   *%eax
  103336:	eb 0f                	jmp    103347 <vprintfmt+0x221>
                }
                else {
                    putch(ch, putdat);
  103338:	8b 45 0c             	mov    0xc(%ebp),%eax
  10333b:	89 44 24 04          	mov    %eax,0x4(%esp)
  10333f:	89 1c 24             	mov    %ebx,(%esp)
  103342:	8b 45 08             	mov    0x8(%ebp),%eax
  103345:	ff d0                	call   *%eax
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
  103347:	ff 4d e8             	decl   -0x18(%ebp)
  10334a:	89 f0                	mov    %esi,%eax
  10334c:	8d 70 01             	lea    0x1(%eax),%esi
  10334f:	0f b6 00             	movzbl (%eax),%eax
  103352:	0f be d8             	movsbl %al,%ebx
  103355:	85 db                	test   %ebx,%ebx
  103357:	74 27                	je     103380 <vprintfmt+0x25a>
  103359:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  10335d:	78 b4                	js     103313 <vprintfmt+0x1ed>
  10335f:	ff 4d e4             	decl   -0x1c(%ebp)
  103362:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  103366:	79 ab                	jns    103313 <vprintfmt+0x1ed>
                }
            }
            for (; width > 0; width --) {
  103368:	eb 16                	jmp    103380 <vprintfmt+0x25a>
                putch(' ', putdat);
  10336a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10336d:	89 44 24 04          	mov    %eax,0x4(%esp)
  103371:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  103378:	8b 45 08             	mov    0x8(%ebp),%eax
  10337b:	ff d0                	call   *%eax
            for (; width > 0; width --) {
  10337d:	ff 4d e8             	decl   -0x18(%ebp)
  103380:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  103384:	7f e4                	jg     10336a <vprintfmt+0x244>
            }
            break;
  103386:	e9 6c 01 00 00       	jmp    1034f7 <vprintfmt+0x3d1>

        // (signed) decimal
        case 'd':
            num = getint(&ap, lflag);
  10338b:	8b 45 e0             	mov    -0x20(%ebp),%eax
  10338e:	89 44 24 04          	mov    %eax,0x4(%esp)
  103392:	8d 45 14             	lea    0x14(%ebp),%eax
  103395:	89 04 24             	mov    %eax,(%esp)
  103398:	e8 0b fd ff ff       	call   1030a8 <getint>
  10339d:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1033a0:	89 55 f4             	mov    %edx,-0xc(%ebp)
            if ((long long)num < 0) {
  1033a3:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1033a6:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1033a9:	85 d2                	test   %edx,%edx
  1033ab:	79 26                	jns    1033d3 <vprintfmt+0x2ad>
                putch('-', putdat);
  1033ad:	8b 45 0c             	mov    0xc(%ebp),%eax
  1033b0:	89 44 24 04          	mov    %eax,0x4(%esp)
  1033b4:	c7 04 24 2d 00 00 00 	movl   $0x2d,(%esp)
  1033bb:	8b 45 08             	mov    0x8(%ebp),%eax
  1033be:	ff d0                	call   *%eax
                num = -(long long)num;
  1033c0:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1033c3:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1033c6:	f7 d8                	neg    %eax
  1033c8:	83 d2 00             	adc    $0x0,%edx
  1033cb:	f7 da                	neg    %edx
  1033cd:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1033d0:	89 55 f4             	mov    %edx,-0xc(%ebp)
            }
            base = 10;
  1033d3:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
            goto number;
  1033da:	e9 a8 00 00 00       	jmp    103487 <vprintfmt+0x361>

        // unsigned decimal
        case 'u':
            num = getuint(&ap, lflag);
  1033df:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1033e2:	89 44 24 04          	mov    %eax,0x4(%esp)
  1033e6:	8d 45 14             	lea    0x14(%ebp),%eax
  1033e9:	89 04 24             	mov    %eax,(%esp)
  1033ec:	e8 64 fc ff ff       	call   103055 <getuint>
  1033f1:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1033f4:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 10;
  1033f7:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
            goto number;
  1033fe:	e9 84 00 00 00       	jmp    103487 <vprintfmt+0x361>

        // (unsigned) octal
        case 'o':
            num = getuint(&ap, lflag);
  103403:	8b 45 e0             	mov    -0x20(%ebp),%eax
  103406:	89 44 24 04          	mov    %eax,0x4(%esp)
  10340a:	8d 45 14             	lea    0x14(%ebp),%eax
  10340d:	89 04 24             	mov    %eax,(%esp)
  103410:	e8 40 fc ff ff       	call   103055 <getuint>
  103415:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103418:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 8;
  10341b:	c7 45 ec 08 00 00 00 	movl   $0x8,-0x14(%ebp)
            goto number;
  103422:	eb 63                	jmp    103487 <vprintfmt+0x361>

        // pointer
        case 'p':
            putch('0', putdat);
  103424:	8b 45 0c             	mov    0xc(%ebp),%eax
  103427:	89 44 24 04          	mov    %eax,0x4(%esp)
  10342b:	c7 04 24 30 00 00 00 	movl   $0x30,(%esp)
  103432:	8b 45 08             	mov    0x8(%ebp),%eax
  103435:	ff d0                	call   *%eax
            putch('x', putdat);
  103437:	8b 45 0c             	mov    0xc(%ebp),%eax
  10343a:	89 44 24 04          	mov    %eax,0x4(%esp)
  10343e:	c7 04 24 78 00 00 00 	movl   $0x78,(%esp)
  103445:	8b 45 08             	mov    0x8(%ebp),%eax
  103448:	ff d0                	call   *%eax
            num = (unsigned long long)(uintptr_t)va_arg(ap, void *);
  10344a:	8b 45 14             	mov    0x14(%ebp),%eax
  10344d:	8d 50 04             	lea    0x4(%eax),%edx
  103450:	89 55 14             	mov    %edx,0x14(%ebp)
  103453:	8b 00                	mov    (%eax),%eax
  103455:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103458:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
            base = 16;
  10345f:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
            goto number;
  103466:	eb 1f                	jmp    103487 <vprintfmt+0x361>

        // (unsigned) hexadecimal
        case 'x':
            num = getuint(&ap, lflag);
  103468:	8b 45 e0             	mov    -0x20(%ebp),%eax
  10346b:	89 44 24 04          	mov    %eax,0x4(%esp)
  10346f:	8d 45 14             	lea    0x14(%ebp),%eax
  103472:	89 04 24             	mov    %eax,(%esp)
  103475:	e8 db fb ff ff       	call   103055 <getuint>
  10347a:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10347d:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 16;
  103480:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
        number:
            printnum(putch, putdat, num, base, width, padc);
  103487:	0f be 55 db          	movsbl -0x25(%ebp),%edx
  10348b:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10348e:	89 54 24 18          	mov    %edx,0x18(%esp)
  103492:	8b 55 e8             	mov    -0x18(%ebp),%edx
  103495:	89 54 24 14          	mov    %edx,0x14(%esp)
  103499:	89 44 24 10          	mov    %eax,0x10(%esp)
  10349d:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1034a0:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1034a3:	89 44 24 08          	mov    %eax,0x8(%esp)
  1034a7:	89 54 24 0c          	mov    %edx,0xc(%esp)
  1034ab:	8b 45 0c             	mov    0xc(%ebp),%eax
  1034ae:	89 44 24 04          	mov    %eax,0x4(%esp)
  1034b2:	8b 45 08             	mov    0x8(%ebp),%eax
  1034b5:	89 04 24             	mov    %eax,(%esp)
  1034b8:	e8 94 fa ff ff       	call   102f51 <printnum>
            break;
  1034bd:	eb 38                	jmp    1034f7 <vprintfmt+0x3d1>

        // escaped '%' character
        case '%':
            putch(ch, putdat);
  1034bf:	8b 45 0c             	mov    0xc(%ebp),%eax
  1034c2:	89 44 24 04          	mov    %eax,0x4(%esp)
  1034c6:	89 1c 24             	mov    %ebx,(%esp)
  1034c9:	8b 45 08             	mov    0x8(%ebp),%eax
  1034cc:	ff d0                	call   *%eax
            break;
  1034ce:	eb 27                	jmp    1034f7 <vprintfmt+0x3d1>

        // unrecognized escape sequence - just print it literally
        default:
            putch('%', putdat);
  1034d0:	8b 45 0c             	mov    0xc(%ebp),%eax
  1034d3:	89 44 24 04          	mov    %eax,0x4(%esp)
  1034d7:	c7 04 24 25 00 00 00 	movl   $0x25,(%esp)
  1034de:	8b 45 08             	mov    0x8(%ebp),%eax
  1034e1:	ff d0                	call   *%eax
            for (fmt --; fmt[-1] != '%'; fmt --)
  1034e3:	ff 4d 10             	decl   0x10(%ebp)
  1034e6:	eb 03                	jmp    1034eb <vprintfmt+0x3c5>
  1034e8:	ff 4d 10             	decl   0x10(%ebp)
  1034eb:	8b 45 10             	mov    0x10(%ebp),%eax
  1034ee:	48                   	dec    %eax
  1034ef:	0f b6 00             	movzbl (%eax),%eax
  1034f2:	3c 25                	cmp    $0x25,%al
  1034f4:	75 f2                	jne    1034e8 <vprintfmt+0x3c2>
                /* do nothing */;
            break;
  1034f6:	90                   	nop
    while (1) {
  1034f7:	e9 36 fc ff ff       	jmp    103132 <vprintfmt+0xc>
                return;
  1034fc:	90                   	nop
        }
    }
}
  1034fd:	83 c4 40             	add    $0x40,%esp
  103500:	5b                   	pop    %ebx
  103501:	5e                   	pop    %esi
  103502:	5d                   	pop    %ebp
  103503:	c3                   	ret    

00103504 <sprintputch>:
 * sprintputch - 'print' a single character in a buffer
 * @ch:            the character will be printed
 * @b:            the buffer to place the character @ch
 * */
static void
sprintputch(int ch, struct sprintbuf *b) {
  103504:	f3 0f 1e fb          	endbr32 
  103508:	55                   	push   %ebp
  103509:	89 e5                	mov    %esp,%ebp
    b->cnt ++;
  10350b:	8b 45 0c             	mov    0xc(%ebp),%eax
  10350e:	8b 40 08             	mov    0x8(%eax),%eax
  103511:	8d 50 01             	lea    0x1(%eax),%edx
  103514:	8b 45 0c             	mov    0xc(%ebp),%eax
  103517:	89 50 08             	mov    %edx,0x8(%eax)
    if (b->buf < b->ebuf) {
  10351a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10351d:	8b 10                	mov    (%eax),%edx
  10351f:	8b 45 0c             	mov    0xc(%ebp),%eax
  103522:	8b 40 04             	mov    0x4(%eax),%eax
  103525:	39 c2                	cmp    %eax,%edx
  103527:	73 12                	jae    10353b <sprintputch+0x37>
        *b->buf ++ = ch;
  103529:	8b 45 0c             	mov    0xc(%ebp),%eax
  10352c:	8b 00                	mov    (%eax),%eax
  10352e:	8d 48 01             	lea    0x1(%eax),%ecx
  103531:	8b 55 0c             	mov    0xc(%ebp),%edx
  103534:	89 0a                	mov    %ecx,(%edx)
  103536:	8b 55 08             	mov    0x8(%ebp),%edx
  103539:	88 10                	mov    %dl,(%eax)
    }
}
  10353b:	90                   	nop
  10353c:	5d                   	pop    %ebp
  10353d:	c3                   	ret    

0010353e <snprintf>:
 * @str:        the buffer to place the result into
 * @size:        the size of buffer, including the trailing null space
 * @fmt:        the format string to use
 * */
int
snprintf(char *str, size_t size, const char *fmt, ...) {
  10353e:	f3 0f 1e fb          	endbr32 
  103542:	55                   	push   %ebp
  103543:	89 e5                	mov    %esp,%ebp
  103545:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    int cnt;
    va_start(ap, fmt);
  103548:	8d 45 14             	lea    0x14(%ebp),%eax
  10354b:	89 45 f0             	mov    %eax,-0x10(%ebp)
    cnt = vsnprintf(str, size, fmt, ap);
  10354e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103551:	89 44 24 0c          	mov    %eax,0xc(%esp)
  103555:	8b 45 10             	mov    0x10(%ebp),%eax
  103558:	89 44 24 08          	mov    %eax,0x8(%esp)
  10355c:	8b 45 0c             	mov    0xc(%ebp),%eax
  10355f:	89 44 24 04          	mov    %eax,0x4(%esp)
  103563:	8b 45 08             	mov    0x8(%ebp),%eax
  103566:	89 04 24             	mov    %eax,(%esp)
  103569:	e8 08 00 00 00       	call   103576 <vsnprintf>
  10356e:	89 45 f4             	mov    %eax,-0xc(%ebp)
    va_end(ap);
    return cnt;
  103571:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  103574:	c9                   	leave  
  103575:	c3                   	ret    

00103576 <vsnprintf>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want snprintf() instead.
 * */
int
vsnprintf(char *str, size_t size, const char *fmt, va_list ap) {
  103576:	f3 0f 1e fb          	endbr32 
  10357a:	55                   	push   %ebp
  10357b:	89 e5                	mov    %esp,%ebp
  10357d:	83 ec 28             	sub    $0x28,%esp
    struct sprintbuf b = {str, str + size - 1, 0};
  103580:	8b 45 08             	mov    0x8(%ebp),%eax
  103583:	89 45 ec             	mov    %eax,-0x14(%ebp)
  103586:	8b 45 0c             	mov    0xc(%ebp),%eax
  103589:	8d 50 ff             	lea    -0x1(%eax),%edx
  10358c:	8b 45 08             	mov    0x8(%ebp),%eax
  10358f:	01 d0                	add    %edx,%eax
  103591:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103594:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    if (str == NULL || b.buf > b.ebuf) {
  10359b:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  10359f:	74 0a                	je     1035ab <vsnprintf+0x35>
  1035a1:	8b 55 ec             	mov    -0x14(%ebp),%edx
  1035a4:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1035a7:	39 c2                	cmp    %eax,%edx
  1035a9:	76 07                	jbe    1035b2 <vsnprintf+0x3c>
        return -E_INVAL;
  1035ab:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  1035b0:	eb 2a                	jmp    1035dc <vsnprintf+0x66>
    }
    // print the string to the buffer
    vprintfmt((void*)sprintputch, &b, fmt, ap);
  1035b2:	8b 45 14             	mov    0x14(%ebp),%eax
  1035b5:	89 44 24 0c          	mov    %eax,0xc(%esp)
  1035b9:	8b 45 10             	mov    0x10(%ebp),%eax
  1035bc:	89 44 24 08          	mov    %eax,0x8(%esp)
  1035c0:	8d 45 ec             	lea    -0x14(%ebp),%eax
  1035c3:	89 44 24 04          	mov    %eax,0x4(%esp)
  1035c7:	c7 04 24 04 35 10 00 	movl   $0x103504,(%esp)
  1035ce:	e8 53 fb ff ff       	call   103126 <vprintfmt>
    // null terminate the buffer
    *b.buf = '\0';
  1035d3:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1035d6:	c6 00 00             	movb   $0x0,(%eax)
    return b.cnt;
  1035d9:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  1035dc:	c9                   	leave  
  1035dd:	c3                   	ret    
