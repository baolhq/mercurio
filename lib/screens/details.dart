import 'package:flutter/material.dart';
import 'package:mercurio/widgets/colored_safe_area.dart';

const text =
    """Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi luctus libero et diam commodo varius. In non tristique eros. Cras fringilla vitae mauris eu dictum. Duis bibendum euismod nibh, et cursus leo dignissim et. Fusce rutrum luctus luctus. Integer ac ultricies ipsum. Morbi magna nisi, dapibus ut dui non, maximus hendrerit ipsum. Donec viverra mattis mollis. Nullam commodo nec lacus et interdum. Nulla aliquam diam non mi gravida gravida. Proin quis sem id leo aliquam rutrum. Mauris leo ante, semper at laoreet sed, convallis vel dolor. Sed ultrices, mi sed elementum vestibulum, velit ex feugiat ante, vitae lacinia nulla ex vitae felis. Maecenas consectetur felis nulla, quis tempus nunc posuere et.

Quisque pharetra condimentum purus porta placerat. Curabitur pellentesque lectus volutpat, feugiat nunc sed, euismod nunc. Aenean vulputate mauris eu placerat laoreet. Donec id laoreet libero, nec suscipit ipsum. In ac nunc accumsan, pharetra tortor sit amet, congue lacus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec dictum, tortor non maximus feugiat, metus elit hendrerit erat, vitae luctus quam leo sed neque. Fusce fringilla imperdiet luctus. Ut semper felis elit, nec iaculis augue porttitor fringilla. Nam non scelerisque lectus. Donec luctus pharetra ex, at posuere ligula dictum vitae. Morbi quis tempor sem. Aenean fringilla dignissim lorem, vel volutpat neque aliquet ac. Nullam aliquam tristique orci, eget sagittis sapien gravida eu. Aliquam hendrerit turpis sed lacus vulputate sollicitudin.

Pellentesque auctor turpis vitae elit ultricies imperdiet. Sed dignissim vestibulum mollis. Praesent quis mauris scelerisque, aliquam diam in, viverra est. Aliquam nec aliquet felis. Donec imperdiet sem quis varius rutrum. Phasellus ultricies neque ac semper fermentum. Vestibulum lacinia, lorem id fermentum porta, enim ligula posuere metus, sit amet tempor quam felis vitae tortor. In facilisis fringilla lectus quis lobortis. Morbi nec elementum lacus. Integer eu lacus tempor, placerat nisl at, mollis purus. Vivamus dictum, erat ut iaculis consequat, nunc ipsum bibendum ligula, in eleifend risus ligula ut urna. Etiam maximus, eros a pulvinar interdum, diam ligula dapibus lorem, nec commodo metus nisl a leo. Phasellus eget euismod erat. Donec aliquam erat vel molestie eleifend.

Donec ac nunc in justo pretium feugiat. Duis auctor orci sed pellentesque faucibus. Etiam lacinia eros ut tincidunt accumsan. In tristique nisl diam, vitae hendrerit orci aliquet accumsan. Nulla porttitor risus lobortis orci eleifend, ut convallis urna varius. Mauris ullamcorper luctus sollicitudin. Duis tristique leo mauris, at auctor nibh congue at. Phasellus pulvinar quam non congue ornare.

Duis eu leo sed libero sodales aliquet gravida quis lorem. Pellentesque a posuere dolor, non interdum tortor. Aliquam id tempus tortor. Suspendisse imperdiet sapien eu libero pretium finibus. Sed venenatis, tellus a malesuada vehicula, sapien arcu vestibulum arcu, sed mollis nibh elit eu eros. Suspendisse pellentesque leo quis ligula laoreet, vel consequat nisl vestibulum. Donec lectus nunc, tempus id elit vitae, semper auctor ex. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vivamus auctor in magna eget ultrices. Nunc scelerisque lacus quis magna pulvinar posuere. Aliquam commodo magna nec posuere pretium. Fusce eget elit eu dolor hendrerit convallis. Nulla facilisi.""";

class Details extends StatelessWidget {
  const Details({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredSafeArea(
        color: Theme.of(context).primaryColor,
        child: Scaffold(
          appBar: AppBar(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(2),
                child: Container(
                  color: Theme.of(context).dividerColor,
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  height: 2,
                ),
              ),
              clipBehavior: Clip.antiAlias,
              leading: Container(
                margin: const EdgeInsets.only(left: 12),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    size: 24,
                  ),
                ),
              ),
              title: const SizedBox(
                width: double.infinity,
                child: Text(
                  "Details",
                  style: TextStyle(fontFamily: "Carnevalee"),
                  textAlign: TextAlign.center,
                ),
              ),
              actions: [
                Container(
                  margin: const EdgeInsets.only(right: 24),
                  child: GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      Icons.bookmark,
                      size: 28,
                    ),
                  ),
                )
              ]),
          body: Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(border: Border.all(width: 2)),
              child: SingleChildScrollView(
                  child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    child: Image.network(
                        "https://w.wallhaven.cc/full/6d/wallhaven-6d7xmx.jpg"),
                  ),
                  const Text(
                    text,
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ))),
        ));
  }
}
