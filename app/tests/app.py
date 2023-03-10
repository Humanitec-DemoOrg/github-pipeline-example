import unittest


class TestHumanitecMethods(unittest.TestCase):

    def test_lower(self):
        self.assertEqual('HUMANITEC'.lower(), 'humanitec')

    def test_bool(self):
        self.assertTrue('humanitec'.islower())
        self.assertFalse('Humanitec'.islower())


if __name__ == '__main__':
    unittest.main()
