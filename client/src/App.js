import { motion, useAnimation } from "framer-motion";
import { useInView } from "react-intersection-observer";
import { useEffect } from "react";

const boxVariantLeft = {
  visible: { opacity: 1, x: 0, transition: { delay: 1 } },
  hidden: { opacity: 0, x: -100 },
}

const boxVariantRight = {
  visible: { opacity: 1, x: 0, transition: { delay: 1 } },
  hidden: { opacity: 0, x: 100 },
}

function App() {
  const leftControl = useAnimation()
  const rightControl = useAnimation()

  const [reTitle, titleInView] = useInView()
  const [refImg, imgInView] = useInView()


  useEffect(() => {
    if (titleInView) {
      leftControl.start("visible");
    }

    if (imgInView) {
      leftControl.start("visible");
    }
  }, [titleInView, leftControl, imgInView]);

  return (
    <div className="App">
      <motion.div
        ref={reTitle}
        variants={boxVariantLeft}
        initial="hidden"
        animate={leftControl}
      >
        <p className="title">CAR-D</p>
      </motion.div>

      <motion.div
        ref={refImg}
        variants={boxVariantRight}
        initial="hidden"
        animate={rightControl}
      >
        <p className="title">CAR-D</p>
      </motion.div>
      
    </div>
  );
}

export default App;
