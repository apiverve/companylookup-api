from setuptools import setup, find_packages

setup(
    name='apiverve_companylookup',
    version='1.1.14',
    packages=find_packages(),
    include_package_data=True,
    install_requires=[
        'requests',
        'setuptools'
    ],
    description='Company Lookup is a tool for retrieving metadata about SEC-registered public companies. Look up companies by ticker symbol, CIK number, company name, or SIC industry code. Returns company details including exchange, address, phone, and more.',
    author='APIVerve',
    author_email='hello@apiverve.com',
    url='https://apiverve.com/marketplace/companylookup?utm_source=pypi&utm_medium=homepage',
    classifiers=[
        'Programming Language :: Python :: 3',
        'Operating System :: OS Independent',
    ],
    python_requires='>=3.6',
)
